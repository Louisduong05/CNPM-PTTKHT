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

ActiveRecord::Schema.define(version: 2018_09_18_123334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exported_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "unit_price"
    t.bigint "export_id"
    t.bigint "product_id"
    t.index ["export_id"], name: "index_exported_items_on_export_id"
    t.index ["product_id"], name: "index_exported_items_on_product_id"
  end

  create_table "exports", force: :cascade do |t|
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_exports_on_user_id"
  end

  create_table "imported_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "unit_price"
  end

  create_table "imports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "quantity"
    t.string "country"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.string "dob"
    t.string "phone"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exported_items", "exports"
  add_foreign_key "exported_items", "products"
  add_foreign_key "exports", "users"
  add_foreign_key "products", "suppliers"
end
