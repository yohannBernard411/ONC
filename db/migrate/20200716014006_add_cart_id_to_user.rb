class AddCartIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :cart, null: true, foreign_key: true
  end
end
