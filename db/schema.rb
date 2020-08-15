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

ActiveRecord::Schema.define(version: 2020_08_15_142319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "user_id"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["order_id"], name: "index_carts_on_order_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "clothe_translations", force: :cascade do |t|
    t.bigint "clothe_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "description"
    t.string "category"
    t.string "option"
    t.string "delivery"
    t.index ["clothe_id"], name: "index_clothe_translations_on_clothe_id"
    t.index ["locale"], name: "index_clothe_translations_on_locale"
  end

  create_table "clothes", force: :cascade do |t|
    t.float "scoring"
    t.integer "nbov"
    t.string "delivery_color"
    t.integer "stock"
    t.string "wire_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.text "description"
    t.string "function"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "code_hexa"
    t.string "code_rgb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "note"
    t.bigint "clothe_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clothe_id"], name: "index_comments_on_clothe_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "delivery_adresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "adress1"
    t.string "adress2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.text "delivery_instructions"
    t.string "code_secure"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number"
  end

  create_table "dyeings", force: :cascade do |t|
    t.bigint "color_id", null: false
    t.bigint "clothe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clothe_id"], name: "index_dyeings_on_clothe_id"
    t.index ["color_id"], name: "index_dyeings_on_color_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "clothe_id"
    t.integer "quantity"
    t.string "size"
    t.string "color"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["clothe_id"], name: "index_line_items_on_clothe_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scalings", force: :cascade do |t|
    t.bigint "size_id", null: false
    t.bigint "clothe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clothe_id"], name: "index_scalings_on_clothe_id"
    t.index ["size_id"], name: "index_scalings_on_size_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.bigint "cart_id"
    t.bigint "delivery_adress_id"
    t.string "username"
    t.string "facebook_id"
    t.string "google_id"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "newsletter"
    t.index ["cart_id"], name: "index_users_on_cart_id"
    t.index ["delivery_adress_id"], name: "index_users_on_delivery_adress_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carts", "orders"
  add_foreign_key "carts", "users"
  add_foreign_key "comments", "clothes"
  add_foreign_key "comments", "users"
  add_foreign_key "dyeings", "clothes"
  add_foreign_key "dyeings", "colors"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "clothes"
  add_foreign_key "scalings", "clothes"
  add_foreign_key "scalings", "sizes"
  add_foreign_key "users", "carts"
  add_foreign_key "users", "delivery_adresses"
end
