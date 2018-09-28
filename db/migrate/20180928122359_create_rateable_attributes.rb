class CreateRateableAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :rateable_attributes do |t|
      t.string :title
      t.timestamps
    end
  end
end
