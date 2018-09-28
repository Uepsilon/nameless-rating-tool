class CreateLocationRateableAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :location_rateable_attributes do |t|
      t.integer :location_id, null: false, index: true
      t.integer :rateable_attribute_id, null: false, index: true
      t.timestamps
    end

    add_index :location_rateable_attributes, %i(location_id rateable_attribute_id), unique: true, name: :unique_rateable_attribute
  end
end
