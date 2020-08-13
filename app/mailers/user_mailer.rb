class UserMailer < ApplicationMailer
  default from: 'yohannb215@gmail.com'
 
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to OceNatCreations.com')
  end

end