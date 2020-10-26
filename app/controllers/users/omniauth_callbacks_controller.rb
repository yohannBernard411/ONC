class Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_facebook(request.env['omniauth.auth'])
      @user.update(facebook_id: request.env['omniauth.auth'].uid)
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.facebook'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])
      @user.update(google_id: request.env['omniauth.auth'].uid)
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end
  end
end
