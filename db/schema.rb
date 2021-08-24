# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_23_120645) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "label"
    t.string "full_address"
    t.string "zip_code"
    t.string "name"
    t.string "phone"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cart_details", force: :cascade do |t|
    t.integer "cart_id"
    t.string "title"
    t.integer "product_id"
    t.float "quantity", default: 0.0
    t.decimal "price", precision: 12, scale: 2
    t.decimal "discount", precision: 12, scale: 2
    t.decimal "subtotal", precision: 12, scale: 2
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_details_on_cart_id"
    t.index ["product_id"], name: "index_cart_details_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "address_id"
    t.decimal "tax", precision: 12, scale: 2
    t.decimal "discount", precision: 12, scale: 2
    t.decimal "shipping_fee", precision: 12, scale: 2
    t.decimal "subtotal", precision: 12, scale: 2
    t.decimal "grand_total", precision: 12, scale: 2
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_carts_on_address_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.string "number"
    t.string "title"
    t.integer "product_id"
    t.float "quantity", default: 0.0
    t.decimal "price", precision: 12, scale: 2
    t.decimal "discount", precision: 12, scale: 2
    t.decimal "subtotal", precision: 12, scale: 2
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["number"], name: "index_order_details_on_number"
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.integer "user_id"
    t.integer "address_id"
    t.decimal "tax", precision: 12, scale: 2
    t.decimal "discount", precision: 12, scale: 2
    t.decimal "shipping_fee", precision: 12, scale: 2
    t.decimal "subtotal", precision: 12, scale: 2
    t.decimal "grand_total", precision: 12, scale: 2
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["number"], name: "index_orders_on_number"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.integer "product_id"
    t.string "code"
    t.string "name"
    t.decimal "price", precision: 12, scale: 2
    t.integer "quantity"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "store_id"
    t.string "code"
    t.string "name"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "logo"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "birthday"
    t.integer "gender"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cart_details", "carts"
  add_foreign_key "cart_details", "products"
  add_foreign_key "carts", "addresses"
  add_foreign_key "carts", "users"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "stores"
end
