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
      t.string :wire_type

      t.timestamps
    end
    reversible do |dir|
      dir.up do
        Clothe.create_translation_table!({
          name: :string,
          description: :string,
          category: :string,
          option: :string,
          delivery: :string
          }, {
            migrate_data: true,
            remove_source_columns: true
          })
      end

      dir.down do
        Clothe.drop_translation_table!
      end
    end
  end
end
