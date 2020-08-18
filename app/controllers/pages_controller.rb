class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
  end

  # tuto amazon mailer
  def send_email
    UserMailer.with(name: params[:name], email: params[:email], message: params[:message]).send_email.deliver_later
    redirect_to root_url, notice: "Email sent!"
  end
  
end
