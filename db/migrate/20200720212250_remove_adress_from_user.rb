class RemoveAdressFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :adress
  end
end
