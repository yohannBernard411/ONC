class LineItemsController < ApplicationController

  def create
    @clothe = Clothe.find(params[:clothe_id])
    authorize @clothe
    @cart = Cart.new(user_id: current_user.id, state: "awaiting") unless @cart = Cart.where(user_id: current_user.id).first
    @cart.save!
    # authorize @cart
    @line_item = LineItem.where(cart_id: @cart.id).where(clothe_id: @clothe.id).where(line_params).first
    if @line_item
      @line_item.quantity += 1
      @line_item.sate = "pending"
    else
      @line_item = LineItem.new(line_params)
      @line_item.cart_id = @cart.id
      @line_item.clothe_id = @clothe.id
      @line_item.quantity = 1
      @line_item.state = "pending"
    end
    # authorize @line_item
    @line_item.save!
    redirect_to @clothe
  end

  def line_params
    params.require(:line_item).permit(:color, :size)
  end

end