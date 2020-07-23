class HomesController < ApplicationController

  def who
    skip_authorization
  end

  def contact
    skip_authorization
  end

end