class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :place_id, null: true, index: true
      t.string :street, null: false
      t.string :street_number, null: false
      t.string :zip_code, null: false
      t.string :city, null: false
      t.string :phone_number
      t.string :website

      t.st_point :lonlat, geographic: true
      t.index :lonlat, using: :gist

      t.timestamps
    end
  end
end
