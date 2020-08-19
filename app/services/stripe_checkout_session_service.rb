class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'payé')
    cart = Cart.where(order_id: order.id).last
    cart.update!(state: "payé")
    lines_item = LineItem.where(cart_id: cart.id)
    lines_item.each do |line|
      line.update!(state: "payé")
    end
  end
end
