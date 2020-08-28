class PartnersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:link, :spitzberg], unless: :skip_pundit?
  skip_after_action :verify_authorized, only: [:link, :spitzberg], unless: :skip_pundit?

  def link
  end

  def spitzberg
  end

end