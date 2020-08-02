class UserMailer < ApplicationMailer
  default from: 'courrier@ocenatcreations.com'
 
  def welcome
    @user = User.last #a remodifier une fois en ligne pour recuperer current_user!!!
    # @url  = 'www.ocenatcreations.com'
    mail(to: @user.email, subject: 'Welcome to OceNatCreations.com')
  end
end