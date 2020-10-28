class PaymentsController < ApplicationController
  def new
    @order = Order.find(Cart.where(user_id: current_user.id).last.order_id)
    authorize @order
  end
end
