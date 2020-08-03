class PaymentsController < ApplicationController
  def new
    @order = Order.where(id: Cart.where(user_id: current_user.id).first.order_id).first
    authorize @order
    raise
  end
end
