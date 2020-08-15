class AddFunctionToClothes < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :function, :string
  end
end
