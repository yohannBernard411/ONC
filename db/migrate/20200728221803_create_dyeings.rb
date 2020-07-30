class CreateDyeings < ActiveRecord::Migration[6.0]
  def change
    create_table :dyeings do |t|
      t.references :color, null: false, foreign_key: true
      t.references :clothe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
