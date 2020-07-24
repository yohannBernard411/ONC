class AddDescriptionToClothe < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :description, :text
  end
end
