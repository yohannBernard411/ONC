class LineItemsController < ApplicationController

  def create
    @clothe = Clothe.find(params[:clothe_id])
    authorize @clothe
    @cart = Cart.new(user_id: current_user.id, state: "pending") unless @cart = Cart.where(user_id: current_user.id).first
    @cart.save!
    # authorize @cart
    test = LineItem.new(line_params)

    @line_item = LineItem.where(cart_id: test.cart_id).where(clothe_id: test.clothe_id).where(state: "pending").where(color: test.color).where(size: test.size).first
  
    if @line_item
      puts "dans le if======================"
      @line_item.quantity += 1
      @line_item.save!
    else
      puts "dans le else===================="
      # @line_item = LineItem.new
      @line_item = LineItem.new(line_params)
      # @color_id = @line_item.color
      # @size_id = @line_item.size
      # @line_item.color = (Color.find(@color_id)).name
      # @line_item.size = (Size.find(@size_id)).name
      # @line_item.color = Color.find(params[:color]).name
      # @line_item.size = Size.find(params[:size]).name
      # @line_item.cart_id = @cart.id
      # @line_item.clothe_id = @clothe.id
      # @line_item.quantity = 1
      # @line_item.state = "pending"
      @line_item.save!
    end
    # authorize @line_item
    # @line_item.save!
    redirect_to @clothe
  end

  def line_params
    params.require(:line_item).permit(:cart_id, :clothe_id, :quantity, :state, :color, :size)
  end

end