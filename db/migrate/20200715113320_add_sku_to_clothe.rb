class AddSkuToClothe < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :sku, :string
  end
end
