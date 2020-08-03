class OrdersController < ApplicationController

  def create
    cart = Cart.find(current_user.cart.id)
    order  = Order.create!(amount_cents: cart.price_cents, state: 'pending')
    cart.order_id = order.id
    cart.save!
    authorize order

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: cart.id,
        images: ["http://res.cloudinary.com/do3nu0tns/image/upload/v1594997331/h1j2nhmbuavymrramr9f.png"],
        amount: cart.price_cents,
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
