class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :location_id, index: true
      t.datetime :visited_at

      t.timestamps
    end
  end
end
