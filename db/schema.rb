# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_28_122651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "location_rateable_attributes", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "rateable_attribute_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id", "rateable_attribute_id"], name: "unique_rateable_attribute", unique: true
    t.index ["location_id"], name: "index_location_rateable_attributes_on_location_id"
    t.index ["rateable_attribute_id"], name: "index_location_rateable_attributes_on_rateable_attribute_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "place_id"
    t.string "street", null: false
    t.string "street_number", null: false
    t.string "zip_code", null: false
    t.string "city", null: false
    t.string "phone_number"
    t.string "website"
    t.geography "lonlat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lonlat"], name: "index_locations_on_lonlat", using: :gist
    t.index ["place_id"], name: "index_locations_on_place_id"
  end

  create_table "rateable_attributes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "visiting_user_id", null: false
    t.integer "rateable_attribute_id", null: false
    t.integer "rating", limit: 2, null: false
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_attribute_id", "visiting_user_id"], name: "index_reviews_on_rateable_attribute_id_and_visiting_user_id", unique: true
    t.index ["rateable_attribute_id"], name: "index_reviews_on_rateable_attribute_id"
    t.index ["visiting_user_id"], name: "index_reviews_on_visiting_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visiting_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "visit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "visit_id"], name: "index_visiting_users_on_user_id_and_visit_id", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.integer "location_id"
    t.datetime "visited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_visits_on_location_id"
  end

end
