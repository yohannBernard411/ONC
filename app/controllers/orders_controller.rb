class OrdersController < ApplicationController

  def create
    clothe = Clothe.find(params[:clothe_id])
    authorize clothe
    order  = Order.create!(clothe: clothe, clothe_sku: clothe.sku, amount: clothe.price, state: 'pending', user: current_user)
    authorize order

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: clothe.name,
        images: [clothe.photos],
        amount: clothe.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
  
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

end
