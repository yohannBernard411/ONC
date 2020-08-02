class User < ApplicationRecord

  attr_accessor :login

  after_create :send_welcome_email


  validates :username, presence: true, uniqueness: {case_sensitive: false }, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}

  has_many :comments
  has_one :delivery_adress
  has_one :cart
  has_many :line_items, through: :cart

  
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: login.downcase).first
    else
      where(conditions.to_hash).first
    end

  end

  def self.from_facebook(auth)
    (where(email: auth.info.email)||where(facebook_id: auth.uid)).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(username: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  private

  def send_welcome_email
    # Tell the UserMailer to send a welcome email after save
    # if Rails.env.production?
    #   UserMailer.with(user: @user).welcome.deliver_later
    # elsif Rails.env.development? 
    #   UserMailer.with(user: @user).welcome.deliver_now
    # end

    require 'mail'
    Mail.defaults do
      delivery_method :smtp, {
        :port      => 587,
        :address   => "smtp.mailgun.org",
        :user_name => ENV['MAILGUN_SMTP_LOGIN'],
        :password  => ENV['MAILGUN_SMTP_PASSWORD'],
      }
    end
    mail = Mail.deliver do
      to      'bernard.yohann516@orange.fr'
      from    'courrier@ocenatcreations.com'
      subject 'Hello'
      text_part do
        body 'Testing some Mailgun awesomness'
      end
    end

  end
end
