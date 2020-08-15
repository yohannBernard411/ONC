class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :load_cart
  
  before_action :authenticate_user!

  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def load_cart
    if current_user
      if current_user.cart
        @all_line_items = LineItem.where(cart_id: current_user.cart.id)
        @total_count = 0
        @all_line_items.each { |line| @total_count += line.quantity }
      end
    end
    # if current_user
    #   if current_user.cart
    #     if LineItem.where(cart_id: Cart.where(user_id: current_user.id))[0]
    #       @all_line_items = LineItem.where(cart_id: (Cart.where(user_id: current_user.id))[0].id)
    #       @total_count = 0
    #       @total_price = 0
    #       @all_line_items.each do |line_item|
    #         @total_count += line_item.quantity
    #         @total_price += (line_item.quantity * (line_item.clothe.price_cents))
    #       end
    #     end
    #   end
    # end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :newsletter, :photo) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :newsletter, :photo) }
  end

  private

  def set_locale
    locale = params[:locale] || cookies[:locale] || I18n.default_locale
    @langue = locale
    I18n.locale = locale
    cookies[:locale] = { value: locale,
                         expires: 30.days.from_now
                        }
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
