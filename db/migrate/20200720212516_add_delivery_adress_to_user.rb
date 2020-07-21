class AddDeliveryAdressToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :delivery_adress, null: false, foreign_key: true
  end
end
