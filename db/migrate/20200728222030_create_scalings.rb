class CreateScalings < ActiveRecord::Migration[6.0]
  def change
    create_table :scalings do |t|
      t.references :size, null: false, foreign_key: true
      t.references :clothe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
