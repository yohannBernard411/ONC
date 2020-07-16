class CartsController < ApplicationController

  def show
    @cart = Cart.where(user_id: current_user.id)[0] # juste un id

    @all_line_items = LineItem.where(cart_id: @cart.id) #cart_id, clothe_id, quantity

    @all_clothes = []

    @all_line_items.each do |line_item|
      @all_clothes << Clothe.find(line_item.clothe_id)
    end
    authorize @cart
  end
    #  cart GET    /carts/:id(.:format)   carts#show

end