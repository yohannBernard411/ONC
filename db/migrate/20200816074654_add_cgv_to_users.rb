class AddCgvToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cgv, :boolean, default: false
  end
end
