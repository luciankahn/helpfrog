class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :phone_number
      t.string :address, null: false
      t.float :latitude, null: false, numeric: true
      t.float :longitude, null: false, numeric: true
      t.text :description

      t.timestamps
    end
  end
end
