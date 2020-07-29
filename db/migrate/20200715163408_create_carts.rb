class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :order, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.string :state
      t.timestamps
    end
  end
end
