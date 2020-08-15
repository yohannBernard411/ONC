class HomesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:who, :contact], unless: :skip_pundit?
  skip_after_action :verify_authorized, only: [:who, :contact], unless: :skip_pundit?

  def who
    
  end

  def contact
  end

  def condition
  end

end