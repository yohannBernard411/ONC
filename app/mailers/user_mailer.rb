class UserMailer < ApplicationMailer
  default from: 'courrier@ocenatcreations.com'

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'First test send email with sendgrid')
  end
end
