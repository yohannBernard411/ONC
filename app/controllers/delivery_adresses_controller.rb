class DeliveryAdressesController < ApplicationController
  def new
    @delivery_adress = DeliveryAdress.new
    authorize @delivery_adress
  end

  def create
    @delivery_adress = DeliveryAdress.new(params_delivery_adress)
    @delivery_adress.save!
    @user = current_user
    @user.delivery_adress_id = @delivery_adress.id
    @user.save!
    authorize @delivery_adress
  end

  private

  def params_delivery_adress
    params.require(:delivery_adress).permit(:first_name, :last_name, :adress1, :adress2, :city,
                                            :state, :zipcode, :phone_number, :delivery_instructions, :code_secure)
  end
end
