class CartsController < ApplicationController

  def show
    puts "===debut==="
    puts "===@cart:==="
    @cart = Cart.where(user_id: current_user.id)[0] # juste un id
    puts "===@all_line_items:==="
    @all_line_items = LineItem.where(cart_id: @cart.id).includes(:clothe) #cart_id, clothe_id, quantity
    puts "===@cart price and name and save:==="
    # @all_clothes = []

    # @cart.price_cents = 0
    # @all_line_items.each do |line_item|
    #   @all_clothes << Clothe.find(line_item.clothe_id)
    #   @cart.price_cents += (Clothe.find(line_item.clothe_id)).price_cents
    # end
    @cart.price_cents = @total_price
    @cart.name = "commande N° xxxx"

    @cart.save!
    puts "===fin==="
    authorize @cart
  end
    #  cart GET    /carts/:id(.:format)   carts#show

end