class ClothesController < ApplicationController

  require 'uri'
  require 'net/http'
  require 'openssl'

  skip_before_action :authenticate_user!, only: [:index], unless: :skip_pundit?
  skip_after_action :verify_authorized, only: [:index], unless: :skip_pundit?

  def index
    @search = params["search"]
    case I18n.locale
    when :fr
      my_locale = 1
    when :en
      my_locale = 0
    when :es
      my_locale = 2
    end
    if @search.present?
      allclothes =  policy_scope(Clothe).all
      @clothes = allclothes.select { |clothe| clothe.translations[my_locale].name.downcase.include? @search[:name].downcase }
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
    @clothe.save!
    name = @clothe.name
    description = @clothe.description
    category = @clothe.category
    delivery = @clothe.delivery
    option = @clothe.option

    I18n.locale = :en

    url = URI("https://microsoft-translator-text.p.rapidapi.com/translate?profanityAction=NoAction&textType=plain&to=en&api-version=3.0")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["x-rapidapi-host"] = ENV['X_RAPIDAPI_HOST']
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
    request["content-type"] = ENV['CONTENT_TYPE']
    request["accept"] = ENV['ACCEPT']
    request.body = "[ {  \"Text\": \"#{name}\" }]"
    response = http.request(request)
    @clothe.name = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{description}\" }]"
    response = http.request(request)
    @clothe.description = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{category}\" }]"
    response = http.request(request)
    @clothe.category = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{delivery}\" }]"
    response = http.request(request)
    @clothe.delivery = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{option}\" }]"
    response = http.request(request)
    @clothe.option = response.read_body.split(":")[5].split(",")[0][1..-2]
    @clothe.save!

    I18n.locale = :es

    url = URI("https://microsoft-translator-text.p.rapidapi.com/translate?profanityAction=NoAction&textType=plain&to=es&api-version=3.0")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["x-rapidapi-host"] = ENV['X_RAPIDAPI_HOST']
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
    request["content-type"] = ENV['CONTENT_TYPE']
    request["accept"] = ENV['ACCEPT']
    request.body = "[ {  \"Text\": \"#{name}\" }]"
    response = http.request(request)
    @clothe.name = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{description}\" }]"
    response = http.request(request)
    @clothe.description = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{category}\" }]"
    response = http.request(request)
    @clothe.category = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{delivery}\" }]"
    response = http.request(request)
    @clothe.delivery = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{option}\" }]"
    response = http.request(request)
    @clothe.option = response.read_body.split(":")[5].split(",")[0][1..-2]
    @clothe.save!

  I18n.locale = :fr

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

    I18n.locale = :fr

    @clothe.update(clothe_params)
    name = @clothe.name
    description = @clothe.description
    category = @clothe.category
    delivery = @clothe.delivery
    option = @clothe.option

    I18n.locale = :en

    url = URI("https://microsoft-translator-text.p.rapidapi.com/translate?profanityAction=NoAction&textType=plain&to=en&api-version=3.0")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["x-rapidapi-host"] = ENV['X_RAPIDAPI_HOST']
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
    request["content-type"] = ENV['CONTENT_TYPE']
    request["accept"] = ENV['ACCEPT']
    request.body = "[ {  \"Text\": \"#{name}\" }]"
    response = http.request(request)
    enname = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{description}\" }]"
    response = http.request(request)
    endescription = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{category}\" }]"
    response = http.request(request)
    encategory = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{delivery}\" }]"
    response = http.request(request)
    endelivery = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{option}\" }]"
    response = http.request(request)
    enoption = response.read_body.split(":")[5].split(",")[0][1..-2]
    @clothe.update(name: enname, description: endescription, category: encategory, delivery: endelivery, option: enoption)

    I18n.locale = :es

    url = URI("https://microsoft-translator-text.p.rapidapi.com/translate?profanityAction=NoAction&textType=plain&to=es&api-version=3.0")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["x-rapidapi-host"] = ENV['X_RAPIDAPI_HOST']
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
    request["content-type"] = ENV['CONTENT_TYPE']
    request["accept"] = ENV['ACCEPT']
    request.body = "[ {  \"Text\": \"#{name}\" }]"
    response = http.request(request)
    esname = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{description}\" }]"
    response = http.request(request)
    esdescription = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{category}\" }]"
    response = http.request(request)
    escategory = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{delivery}\" }]"
    response = http.request(request)
    esdelivery = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{option}\" }]"
    response = http.request(request)
    esoption = response.read_body.split(":")[5].split(",")[0][1..-2]
    @clothe.update(name: esname, description: esdescription, category: escategory, delivery: esdelivery, option: esoption)

    I18n.locale = :fr

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
    params.require(:clothe).permit(:name, :name2, :name3, :category, :description, :option, :price_cents, :scoring, :nbov, :delivery, :delivery_color, :stock, photos: [])
  end

end
