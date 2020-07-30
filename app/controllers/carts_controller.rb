class CartsController < ApplicationController

  def index
    @carts = Cart.all
    @all_line_items = LineItem.all
    @clothes = Clothe.all
    @orders = Order.all
    authorize @carts
  end

  def show
    @cart = Cart.where(user_id: current_user.id)[0]
    @all_line_items = LineItem.where(cart_id: @cart.id).includes(:clothe)
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