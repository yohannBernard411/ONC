class ArticlesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:label, :lin], unless: :skip_pundit?
  skip_after_action :verify_authorized, only: [:label, :lin], unless: :skip_pundit?

  def label
  end

  def lin
  end
  
end
