class ApplicationMailer < ActionMailer::Base
  default from: 'emailing@bernardyohann.fr'
  API_KEY = ENV['MAILGUN_API_KEY']
  API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/ocenatcreations.herokuapp.com"
  layout 'mailer'
end
