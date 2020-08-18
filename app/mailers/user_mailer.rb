class UserMailer < ApplicationMailer
  def send_email(options={})
    @name = options[:name]
    @email = options[:email]
    @message = options[:message]
    mail(:to=>"bernard.yohann516@orange.fr", :subject=>"Amazon SES Email")
  end
end