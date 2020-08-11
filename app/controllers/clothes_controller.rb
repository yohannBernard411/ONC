class ClothesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index], unless: :skip_pundit?
  skip_after_action :verify_authorized, only: [:index], unless: :skip_pundit?

  def index
    @search = params["search"]
    if @search.present?
      @clothes = policy_scope(Clothe).where("name ILIKE ?", "%#{@search["name"]}%").order(created_at: :desc)
      unless @clothes.first
        @clothes = policy_scope(Clothe).order(created_at: :desc).includes([:photos_attachments])
        redirect_to clothes_path, notice: "Aucune correspondance!"
      end
    else
      @clothes = policy_scope(Clothe).order(created_at: :desc).includes([:photos_attachments])
    end
  end

  def show
    @line_item = LineItem.new
    @clothe = Clothe.find(params[:id])
    @comments = Comment.where(clothe_id: @clothe.id)
    authorize @clothe
    authorize @comments
  end

  def new
    @clothe = Clothe.new
    authorize @clothe
  end

  def create
    @clothe = Clothe.new(clothe_params)
    authorize @clothe
    if @clothe.save
      redirect_to @clothe
    else
      render 'new'
    end
  end

  def edit
    @clothe = Clothe.find(params[:id])
    authorize @clothe
  end

  def update
    @clothe = Clothe.find(params[:id])
    authorize @clothe
    if @clothe.update(clothe_params)
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

  def add
    @clothe = Clothe.find(params[:id])
    @cart = Cart.new(user_id: current_user.id, state: "awaiting") unless @cart = Cart.where(user_id: current_user.id)[0]
    @cart.save!
    # authorize @cart
    @line_item = LineItem.where(cart_id: @cart.id).where(clothe_id: @clothe.id).where(size: params[:size]).where(color: params[:color]).first
    if @line_item
      @line_item.quantity += 1
    else
      @line_item = LineItem.new(cart_id: @cart.id, clothe_id: @clothe.id, quantity: 1, size: params[:size], color: params[:color])
    end
    # authorize @line_item
    @line_item.save!
    redirect_to @clothe
  end

  def remove
    @clothe = Clothe.find(params[:id])
    @line_item = LineItem.where(cart_id: Cart.where(user_id: current_user.id)[0].id).where(clothe_id: @clothe.id)[0]
    @line_item.destroy
    redirect_to @clothe
  end

  private

  def clothe_params
    params.require(:clothe).permit(:name, :category, :description, :option, :price_cents, :scoring, :nbov, :delivery, :delivery_color, :stock, photos: [])
  end

end
