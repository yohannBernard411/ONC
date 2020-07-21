class CreateDeliveryAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_adresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :adress1
      t.string :adress2
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :phone_number
      t.text :delivery_instructions
      t.string :code_secure

      t.timestamps
    end
  end
end
