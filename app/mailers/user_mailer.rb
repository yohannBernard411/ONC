class UserMailer < ApplicationMailer
  default from: 'courrier@ocenatcreations.herokuapp.com'
 
  def welcome_email
    @user = User.first  # a remplacer par le current user (User.find(params[:user_id])) a voir!!!
    @url  = 'http://ocenatcreations.herokuapp.com'
    mail(to: @user.email,
         subject: 'Welcome to My Awesome Site')
  end
end