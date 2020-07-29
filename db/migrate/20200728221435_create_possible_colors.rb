class CreatePossibleColors < ActiveRecord::Migration[6.0]
  def change
    create_table :possible_colors do |t|
      t.string :name
      t.string :code_hexa
      t.string :code_rgb

      t.timestamps
    end
  end
end
