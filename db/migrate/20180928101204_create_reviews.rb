class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :visiting_user_id, null: false, index: true
      t.integer :rateable_attribute_id, null: false, index: true
      t.integer :rating, null: false, limit: 1
      t.text :review

      t.timestamps

    end
    add_index :reviews, %i(rateable_attribute_id visiting_user_id), unique: true
  end
end
