class ClothesController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'openssl'

  skip_before_action :authenticate_user!, only: [:index], unless: :skip_pundit?
  skip_after_action :verify_authorized, only: [:index], unless: :skip_pundit?
  before_action :function_params, only: %i[index new destroy]

  def index
    @search = params["search"]
    if @search.present?
      @clothes = policy_scope(Clothe).all.select { |clothe| clothe.name.downcase.include? @search[:name].downcase }
      unless @clothes.first
        @clothes = policy_scope(Clothe).order(created_at: :desc).includes([:photos_attachments])
        redirect_to clothes_by_type_path(@function), notice: I18n.translate("clothes.index.nothing")
      end
    else
      @clothes = policy_scope(Clothe).where(function: @function).order(created_at: :desc).includes([:photos_attachments]).includes([:translations])
    end
  end

  def show
    @line_item = LineItem.new
    @clothe = Clothe.find(params[:id])
    if current_user && Cart.where(user_id: current_user.id).where(state: "panier").last.nil?
      cart = Cart.create!(state: "panier", user_id: current_user.id)
      current_user.update(cart_id: cart.id)
    end
    @comments = Comment.where(clothe_id: @clothe.id).includes(:user)
    authorize @clothe
    authorize @comments
  end

  def new
    @clothe = Clothe.new
    authorize @clothe
  end

  def create
    I18n.locale = :fr
    @clothe = Clothe.new(clothe_params)
    @clothe.scoring = 5
    @clothe.nbov = 0
    @clothe.save!

    TraductionService.trad(@clothe, @clothe.name, @clothe.description, @clothe.category, @clothe.delivery, @clothe.option, "en")
    TraductionService.trad(@clothe, @clothe.name, @clothe.description, @clothe.category, @clothe.delivery, @clothe.option, "es")

    authorize @clothe
    if @clothe.save
      redirect_to @clothe
    else
      render 'new'
    end
  end

  def edit
    @clothe = Clothe.find(params[:id])
    @sizes = Size.all
    @scalings = Scaling.where(clothe_id: @clothe.id)
    @scaling = Scaling.new
    @colors = Color.all
    @dyeings = Dyeing.where(clothe_id: @clothe.id)
    @dyeing = Dyeing.new
    authorize @clothe
  end

  def update
    @clothe = Clothe.find(params[:id])
    I18n.locale = :fr
    @clothe.update(clothe_params)

    TraductionService.trad(@clothe, @clothe.name, @clothe.description, @clothe.category, @clothe.delivery, @clothe.option, "en")
    TraductionService.trad(@clothe, @clothe.name, @clothe.description, @clothe.category, @clothe.delivery, @clothe.option, "es")

    authorize @clothe
    if @clothe.persisted?
      redirect_to @clothe
    else
      render 'edit'
    end
  end

  def destroy
    @clothe = Clothe.find(params[:id])
    authorize @clothe
    @clothe.destroy
    redirect_to clothes_path
  end

  private

  def clothe_params
    params.require(:clothe).permit(:name, :function, :category, :description, :wire_type, :option, :price_cents, :scoring, :nbov, :delivery, :delivery_color, :stock, photos: [])
  end

  def function_params
    @function = params[:function]
  end
end
