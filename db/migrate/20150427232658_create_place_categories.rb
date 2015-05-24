class CreatePlaceCategories < ActiveRecord::Migration
  def change
    create_table :place_categories do |t|
      t.references :place
      t.references :category
      t.timestamps
    end
  end
end
