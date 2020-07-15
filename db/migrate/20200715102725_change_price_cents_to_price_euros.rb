class ChangePriceCentsToPriceEuros < ActiveRecord::Migration[6.0]
  def change
    remove_column :clothes, :price_cents, :integer
    add_monetize :clothes, :price, currency: { present: false }
  end
end
