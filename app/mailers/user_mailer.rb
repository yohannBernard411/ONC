
class UserMailer < ApplicationMailer
  default from: 'ocenatcreations@orange.fr'
 
  def welcome
    @user = User.last
    @url  = 'http://ocenatcreations.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end