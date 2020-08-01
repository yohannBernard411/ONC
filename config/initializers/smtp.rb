ActionMailer::Base.delivery_method = :smtp
if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :port           => ENV['MAILGUN_SMTP_PORT'],
    :address        => ENV['MAILGUN_SMTP_SERVER'],
    :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
    :password       => ENV['MAILGUN_SMTP_PASSWORD'],
    :domain         => 'ocenatcreations.herokuapp.com',
    :authentication => :plain,
  }
elsif Rails.env.development?
  ActionMailer::Base.smtp_settings = {
    address: 'localhost',
    port: 1025,
  }
end
