class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :cart, foreign_key: true
      t.references :clothe, foreign_key: true
      t.integer :quantity
      t.string :size
      t.string :color
      t.string :state


      t.timestamps
    end
  end
end
