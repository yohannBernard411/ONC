class CartsController < ApplicationController
  def index
    @line_items = LineItem.all.order(id: :desc).includes([:clothe])
    @carts = policy_scope(Cart).where.not(order_id: nil).order(id: :desc)
    authorize @line_items
    authorize @carts
  end

  def show
    @cart = Cart.where(user_id: current_user.id).where(state: "panier").last
    @all_line_items = LineItem.where(cart_id: @cart.id).includes(:clothe).order(id: :desc)
    @total_price = 0
    @all_line_items.each do |line|
      @total_price += (line.quantity * (line.clothe.price_cents / 100))
    end
    @cart.price_cents = @total_price
    current_user.cart.price_cents = @total_price
    @cart.save!
    authorize @cart
  end
end
