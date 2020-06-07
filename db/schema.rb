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

ActiveRecord::Schema.define(version: 2020_06_04_184807) do

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

  create_table "addresses_parties", id: false, force: :cascade do |t|
    t.bigint "party_id", null: false
    t.bigint "address_id", null: false
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string "email_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "email_addresses_parties", id: false, force: :cascade do |t|
    t.bigint "party_id", null: false
    t.bigint "email_address_id", null: false
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

  create_table "parties_phone_numbers", id: false, force: :cascade do |t|
    t.bigint "party_id", null: false
    t.bigint "phone_number_id", null: false
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
    t.string "short_name"
    t.string "long_name"
  end

  create_table "store_transaction_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "store_transaction_line_items", force: :cascade do |t|
    t.bigint "store_transaction_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.integer "tax_cents", default: 0, null: false
    t.string "tax_currency", default: "USD", null: false
    t.index ["product_id"], name: "index_store_transaction_line_items_on_product_id"
    t.index ["store_transaction_id"], name: "index_store_transaction_line_items_on_store_transaction_id"
  end

  create_table "store_transactions", force: :cascade do |t|
    t.bigint "party_id", null: false
    t.datetime "transaction_datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "store_transaction_category_id", null: false
    t.index ["party_id"], name: "index_store_transactions_on_party_id"
    t.index ["store_transaction_category_id"], name: "index_store_transactions_on_store_transaction_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "people", "households"
  add_foreign_key "store_transaction_line_items", "products"
  add_foreign_key "store_transaction_line_items", "store_transactions"
  add_foreign_key "store_transactions", "parties"
  add_foreign_key "store_transactions", "store_transaction_categories"
end
