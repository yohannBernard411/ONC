class CreateDyeings < ActiveRecord::Migration[6.0]
  def change
    create_table :dyeings do |t|
      t.references :possible_colors, null: false, foreign_key: true
      t.references :clothes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
