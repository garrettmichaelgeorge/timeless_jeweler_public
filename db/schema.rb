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

ActiveRecord::Schema.define(version: 0) do

  create_table "addresses", force: :cascade do |t|
    t.text "address_line_1"
    t.text "address_line_2"
    t.text "city"
    t.integer "postal_code"
    t.integer "state_province_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_province_id_id"], name: "index_addresses_on_state_province_id_id"
  end

  create_table "country_region_tables", force: :cascade do |t|
    t.string "name"
  end

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
    t.integer "products_id"
    t.index ["household_id"], name: "index_customers_on_household_id"
    t.index ["products_id"], name: "index_customers_on_products_id"
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

  create_table "product_categories", force: :cascade do |t|
    t.string "product_category_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "metal"
    t.string "purity"
    t.decimal "size"
    t.decimal "length"
    t.decimal "weight"
    t.text "miscellaneous_measurements"
    t.string "color"
    t.string "clarity"
    t.integer "report_number"
    t.text "narrative_description"
    t.decimal "cost"
    t.text "notes"
    t.decimal "retail_price"
    t.string "source"
    t.date "date_sold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product_category_id"
    t.integer "customers_id"
    t.index ["customers_id"], name: "index_products_on_customers_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "state_province_tables", force: :cascade do |t|
    t.string "name"
    t.string "state_province_code"
    t.boolean "is_only_state_province?"
    t.integer "country_region_id_id", null: false
    t.index ["country_region_id_id"], name: "index_state_province_tables_on_country_region_id_id"
  end

end
