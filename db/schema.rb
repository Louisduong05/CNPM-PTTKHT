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

ActiveRecord::Schema.define(version: 2020_04_30_031928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "country"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exported_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "export_id"
    t.bigint "product_id"
    t.bigint "warehouse_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_price"
    t.index ["export_id"], name: "index_exported_items_on_export_id"
    t.index ["product_id"], name: "index_exported_items_on_product_id"
    t.index ["warehouse_id"], name: "index_exported_items_on_warehouse_id"
  end

  create_table "exports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_exports_on_customer_id"
    t.index ["user_id"], name: "index_exports_on_user_id"
  end

  create_table "imported_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "unit_price"
    t.bigint "import_id"
    t.bigint "product_id"
    t.string "status"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["import_id"], name: "index_imported_items_on_import_id"
    t.index ["product_id"], name: "index_imported_items_on_product_id"
    t.index ["warehouse_id"], name: "index_imported_items_on_warehouse_id"
  end

  create_table "imports", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_imports_on_supplier_id"
    t.index ["user_id"], name: "index_imports_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "link"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "read", default: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "product_items", force: :cascade do |t|
    t.string "code"
    t.bigint "product_id"
    t.bigint "imported_item_id"
    t.bigint "exported_item_id"
    t.bigint "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exported_item_id"], name: "index_product_items_on_exported_item_id"
    t.index ["imported_item_id"], name: "index_product_items_on_imported_item_id"
    t.index ["product_id"], name: "index_product_items_on_product_id"
    t.index ["user_id"], name: "index_product_items_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "original_price", default: 0
    t.integer "quantity", default: 0
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "size"
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "address"
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
    t.string "type", default: "User"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.string "current"
    t.string "capacity"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exported_items", "exports"
  add_foreign_key "exported_items", "products"
  add_foreign_key "exported_items", "warehouses"
  add_foreign_key "exports", "customers"
  add_foreign_key "exports", "users"
  add_foreign_key "imported_items", "imports"
  add_foreign_key "imported_items", "products"
  add_foreign_key "imported_items", "warehouses"
  add_foreign_key "imports", "suppliers"
  add_foreign_key "imports", "users"
  add_foreign_key "product_items", "exported_items"
  add_foreign_key "product_items", "imported_items"
  add_foreign_key "product_items", "products"
  add_foreign_key "product_items", "users"
  add_foreign_key "products", "brands"
end
