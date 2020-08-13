class LineItemsController < ApplicationController

  def create
    @clothe = Clothe.find(params[:clothe_id])
    @cart = Cart.new(user_id: current_user.id, state: "pending") unless @cart = Cart.where(user_id: current_user.id).first
    @cart.save!
    test = LineItem.new(line_params)
    @line_item = test
    if test.color != "" && test.size != ""
      @line_item = LineItem.where(cart_id: test.cart_id).where(clothe_id: test.clothe_id).where(state: "pending").where(color: test.color).where(size: test.size).first
      if @line_item
        @line_item.quantity += 1
        @line_item.save!
      else
        @line_item = LineItem.new(line_params)
        @line_item.save!
      end
      authorize @line_item
      redirect_to @clothe, notice: "Cet article a été ajouté à votre panier"
    else
      authorize @line_item
      redirect_to @clothe, alert: "Vous devez choisir une couleur et une taille"
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    authorize @line_item
    redirect_to (Cart.find(@line_item.cart_id)), notice: "Votre article a bien été effacé!"
  end

  private

  def line_params
    params.require(:line_item).permit(:cart_id, :clothe_id, :quantity, :state, :color, :size)
  end

end