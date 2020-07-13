class ApplicationController < ActionController::Base

  before_action :set_locale

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

end
