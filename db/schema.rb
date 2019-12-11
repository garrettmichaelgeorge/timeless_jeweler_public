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

ActiveRecord::Schema.define(version: 2019_12_11_152807) do

  create_table "customers", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.integer "household_id", null: false
    t.string "gender", limit: 1
    t.decimal "ring_size", precision: 2, scale: 2
    t.text "ring_size_notes", limit: 140
    t.integer "necklace_length", limit: 2
    t.text "necklace_length_notes", limit: 140
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_customers_on_household_id"
  end

  create_table "households", force: :cascade do |t|
    t.string "household_name", limit: 25
    t.string "street_name_and_no", limit: 50
    t.string "city", limit: 25
    t.string "state", limit: 2
    t.string "zip", limit: 5
    t.string "country", limit: 2
    t.string "marital_status", limit: 9
    t.date "anniversary"
    t.string "referral_source", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "customers", "households"
end
