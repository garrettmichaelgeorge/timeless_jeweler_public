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

ActiveRecord::Schema.define(version: 2020_05_21_223647) do

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
    t.bigint "party_contact_method_id"
    t.index ["party_contact_method_id"], name: "index_addresses_on_party_contact_method_id"
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string "email_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "party_contact_method_id"
    t.index ["party_contact_method_id"], name: "index_email_addresses_on_party_contact_method_id"
  end

  create_table "households", force: :cascade do |t|
    t.string "household_name", limit: 40
    t.date "anniversary"
  end

  create_table "parties", force: :cascade do |t|
    t.string "party_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "actable_id"
    t.string "actable_type"
  end

  create_table "party_contact_methods", force: :cascade do |t|
    t.bigint "party_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["party_id"], name: "index_party_contact_methods_on_party_id"
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
    t.date "birthday"
    t.bigint "household_id"
    t.index ["household_id"], name: "index_people_on_household_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "phone_number_complete", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "party_contact_method_id"
    t.index ["party_contact_method_id"], name: "index_phone_numbers_on_party_contact_method_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 40
    t.text "description"
    t.string "brand", limit: 40
    t.decimal "size", precision: 7, scale: 2
    t.string "size_unit"
    t.decimal "weight", precision: 7, scale: 2
    t.string "weight_unit"
    t.text "misc_measurements"
    t.decimal "cost", precision: 10, scale: 2
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "party_contact_methods"
  add_foreign_key "email_addresses", "party_contact_methods"
  add_foreign_key "party_contact_methods", "parties"
  add_foreign_key "people", "households"
  add_foreign_key "phone_numbers", "party_contact_methods"
end
