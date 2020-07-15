class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :clothe, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
