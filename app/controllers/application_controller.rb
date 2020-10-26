class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :load_cart

  before_action :authenticate_user!

  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def load_cart
    return unless current_user

    carts = Cart.where(user_id: current_user.id)
    cart = carts.where(state: "panier").last
    return unless cart

    @all_line_items = LineItem.where(cart_id: cart.id)
    @total_count = 0
    @all_line_items.each { |line| @total_count += line.quantity }
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :newsletter, :photo, :cgv)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :remember_me, :newsletter, :photo, :cgv)
    end
  end

  private

  def set_locale
    locale = params[:locale] || cookies[:locale] || I18n.default_locale
    @langue = locale
    I18n.locale = locale
    cookies[:locale] = { value: locale,
                         expires: 30.days.from_now }
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
