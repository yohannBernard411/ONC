class AddDeliveryAdressToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :delivery_adress, foreign_key: true  #remettre null: false
  end
end
