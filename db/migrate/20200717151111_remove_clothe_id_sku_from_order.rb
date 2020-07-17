class RemoveClotheIdSkuFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :clothe_id
    remove_column :orders, :clothe_sku
  end
end
