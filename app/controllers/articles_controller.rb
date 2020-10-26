class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[label lin], unless: :skip_pundit?
  skip_after_action :verify_authorized, only: %i[label lin], unless: :skip_pundit?

  def label
  end

  def lin
  end
end
