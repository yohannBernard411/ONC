class LineItemsController < ApplicationController

  def create
    @clothe = Clothe.find(params[:clothe_id])
    @cart = Cart.where(user_id: current_user.id).where(state: "panier").last
    test = LineItem.new(line_params)
    @line_item = test
    if test.color != "" && test.size != ""
      @line_item = LineItem.where(cart_id: test.cart_id).where(clothe_id: test.clothe_id).where(state: "panier").where(color: test.color).where(size: test.size).first
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

  def prev
    line = LineItem.find(params[:line_id])
    states = ["panier", "payé", "réalisation", "réalisé", "envoi", "cloturé"]
    before = line.state
    rank = states.index(before) || 0
    line.state = states[rank-1]
    line.save!
    authorize line
    redirect_to carts_path
  end

  def next
    line = LineItem.find(params[:line_id])
    states = ["panier", "payé", "réalisation", "réalisé", "envoi", "cloturé"]
    before = line.state
    rank = states.index(before) || 0
    line.state = states[rank+1] || states[0]
    line.save!
    authorize line
    redirect_to carts_path
  end

  def up
    line = LineItem.find(params[:line_id])
    line.quantity += 1
    line.save!
    authorize line
    redirect_to cart_path(line.cart_id)
  end

  def down
    line = LineItem.find(params[:line_id])
    line.quantity -= 1
    line.save!
    if line.quantity == 0
      line.destroy
    end
    authorize line
    redirect_to cart_path(line.cart_id)
  end

  private

  def line_params
    params.require(:line_item).permit(:cart_id, :clothe_id, :quantity, :state, :color, :size)
  end

end