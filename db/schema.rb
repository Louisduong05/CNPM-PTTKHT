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

ActiveRecord::Schema.define(version: 2020_12_16_143401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_brands_on_deleted_at"
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
    t.datetime "deleted_at"
    t.bigint "export_id"
    t.bigint "product_id"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_price"
    t.index ["deleted_at"], name: "index_exported_items_on_deleted_at"
    t.index ["export_id"], name: "index_exported_items_on_export_id"
    t.index ["product_id"], name: "index_exported_items_on_product_id"
    t.index ["warehouse_id"], name: "index_exported_items_on_warehouse_id"
  end

  create_table "exports", force: :cascade do |t|
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_exports_on_customer_id"
    t.index ["deleted_at"], name: "index_exports_on_deleted_at"
    t.index ["user_id"], name: "index_exports_on_user_id"
  end

  create_table "imported_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "unit_price"
    t.datetime "deleted_at"
    t.bigint "import_id"
    t.bigint "product_id"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_imported_items_on_deleted_at"
    t.index ["import_id"], name: "index_imported_items_on_import_id"
    t.index ["product_id"], name: "index_imported_items_on_product_id"
    t.index ["warehouse_id"], name: "index_imported_items_on_warehouse_id"
  end

  create_table "imports", force: :cascade do |t|
    t.datetime "deleted_at"
    t.bigint "user_id"
    t.bigint "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["deleted_at"], name: "index_imports_on_deleted_at"
    t.index ["supplier_id"], name: "index_imports_on_supplier_id"
    t.index ["user_id"], name: "index_imports_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "link"
    t.string "message"
    t.boolean "read", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["deleted_at"], name: "index_notifications_on_deleted_at"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "pays", force: :cascade do |t|
    t.bigint "export_id"
    t.bigint "user_id"
    t.string "code"
    t.integer "payment_by"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["export_id"], name: "index_pays_on_export_id"
    t.index ["user_id"], name: "index_pays_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "original_price", default: 0
    t.integer "quantity", default: 0
    t.text "remarks"
    t.boolean "is_active", default: true
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "size"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_suppliers_on_deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.string "dob"
    t.string "phone"
    t.string "address"
    t.string "type", default: "User"
    t.boolean "is_active", default: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.integer "current", default: 0
    t.integer "capacity"
    t.boolean "status", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_warehouses_on_deleted_at"
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
  add_foreign_key "products", "brands"
end
