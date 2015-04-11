class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content, null: false
      t.integer :rating
      t.string :password, null: false
      t.references :place, null: false

      t.timestamps
    end
  end
end
