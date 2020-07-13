class ClothesController < ApplicationController

  def index
    @clothes = policy_scope(Clothe).order(created_at: :desc)
  end

  def show
    @clothe = Clothe.find(params[:id])
    authorize @clothe
  end

  def new
    @clothe = Clothe.new
    authorize @clothe
  end

  def create
    @clothe = Clothe.new(clothe_params)
    authorize @clothe
    if @clothe.save
      redirect_to @clothe
    else
      render 'new'
    end
  end

  def edit
    @clothe = Clothe.find(params[:id])
    authorize @clothe
  end

  def update
   @clothe = Clothe.find(params[:id])
   authorize @clothe
   if @clothe.update(clothe_params)
     redirect_to @clothe
   else
     render 'edit'
   end
 end

 def destroy
  @clothe = Clothe.find(params[:id])
  authorize @clothe
  @clothe.destroy
  redirect_to clothes_path
end

  private

  def clothe_params
    params.require(:clothe).permit(:name, :category, :option, :price_cents, :scoring, :nbov, :delivery, :delivery_color, :stock, photos: [])
  end

end
