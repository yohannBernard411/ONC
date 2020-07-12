class CreateClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :clothes do |t|
      t.string :name
      t.string :category
      t.string :option
      t.integer :price_cents
      t.float :scoring
      t.integer :nbov
      t.string :delivery
      t.string :delivery_color
      t.integer :stock

      t.timestamps
    end
  end
end
