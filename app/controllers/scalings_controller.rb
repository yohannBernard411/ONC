class ScalingsController < ApplicationController

  def create
    @scaling = Scaling.new(params_scale)
    @scaling.clothe_id = params[:clothe_id]
    @scaling.save!
    authorize @scaling
    redirect_to edit_clothe_path(params[:clothe_id], anchor: "ajout"), notice: "Taille ajoutée"
  end

  def destroy
    @scaling = Scaling.find(params[:id])
    @scaling.destroy
    authorize @scaling
    redirect_to edit_clothe_path(params[:clothe_id], anchor: "ajout"), alert: "Taille supprimée"
  end

  private

  def params_scale
    params.require(:scaling).permit(:size_id)
  end

end