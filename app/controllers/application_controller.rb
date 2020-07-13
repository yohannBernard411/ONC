class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def default_url_options
    { locale: I18n.locale }
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
