class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :note

      t.references :clothe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
