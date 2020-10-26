class DyeingsController < ApplicationController
  def create
    @dyeing = Dyeing.new(params_color)
    @dyeing.clothe_id = params[:clothe_id]
    @dyeing.save!
    authorize @dyeing
    redirect_to edit_clothe_path(params[:clothe_id], anchor: "ajout"), notice: "Couleur ajoutée"
  end

  def destroy
    @dyeing = Dyeing.find(params[:id])
    @dyeing.destroy
    authorize @dyeing
    redirect_to edit_clothe_path(params[:clothe_id], anchor: "ajout"), alert: "Couleur supprimée"
  end

  private

  def params_color
    params.require(:dyeing).permit(:color_id)
  end
end
