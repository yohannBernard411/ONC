class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :note
      t.integer :user_id
      t.references :clothe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
