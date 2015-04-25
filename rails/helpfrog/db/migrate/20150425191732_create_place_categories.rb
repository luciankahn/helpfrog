class CreatePlaceCategories < ActiveRecord::Migration
  def change
    create_table :place_categories do |t|
      t.references :place
      t.references :category
      t.timestamps null: false
    end
  end
end
