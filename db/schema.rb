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

ActiveRecord::Schema[8.0].define(version: 2024_12_01_072811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug"
    t.string "color"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "description", null: false
    t.decimal "amount", precision: 22, scale: 2
    t.string "currency"
    t.date "date"
    t.bigint "category_id", null: false
    t.bigint "payment_method_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amount"], name: "index_expenses_on_amount"
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["currency"], name: "index_expenses_on_currency"
    t.index ["date"], name: "index_expenses_on_date"
    t.index ["payment_method_id"], name: "index_expenses_on_payment_method_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name", null: false
    t.string "bank"
    t.boolean "cash", default: true
    t.boolean "credit_card", default: false
    t.boolean "debit_card", default: false
    t.boolean "digital_wallet", default: false
    t.string "slug"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_payment_methods_on_slug"
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale", default: "es-PE"
    t.string "password_digest"
    t.index ["active"], name: "index_users_on_active"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "categories", "users"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "payment_methods"
  add_foreign_key "expenses", "users"
  add_foreign_key "payment_methods", "users"
end
