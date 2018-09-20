class CreateVisitingUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :visiting_users do |t|
      t.integer :user_id
      t.integer :visit_id

      t.index [:user_id, :visit_id], unique: true

      t.timestamps
    end
  end
end
