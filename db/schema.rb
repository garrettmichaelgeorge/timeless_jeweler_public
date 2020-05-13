# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_12_201517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_line_1", limit: 80
    t.string "address_line_2", limit: 80
    t.string "city", limit: 30
    t.string "state_province", limit: 2
    t.string "country_region", limit: 2
    t.integer "zip_postal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "households", force: :cascade do |t|
    t.string "household_name", limit: 40
    t.date "anniversary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "party_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "actable_id"
    t.string "actable_type"
  end

  create_table "people", force: :cascade do |t|
    t.string "title", limit: 20
    t.string "first_name", limit: 40
    t.string "last_name", limit: 40
    t.string "suffix", limit: 20
    t.decimal "ring_size", precision: 4, scale: 2
    t.text "ring_size_notes"
    t.decimal "necklace_length", precision: 4, scale: 2
    t.text "necklace_length_notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
