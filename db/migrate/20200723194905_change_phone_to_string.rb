class ChangePhoneToString < ActiveRecord::Migration[6.0]
  def change
    remove_column :delivery_adresses, :phone_number, :integer
    add_column :delivery_adresses, :phone_number, :string
  end
end
