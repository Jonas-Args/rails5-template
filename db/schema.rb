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

ActiveRecord::Schema.define(version: 20180604144351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_attributes", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "car_id"
    t.index ["car_id"], name: "index_car_attributes_on_car_id"
  end

  create_table "car_models", force: :cascade do |t|
    t.string "manufacturer", default: ""
    t.string "model", default: ""
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.bigint "address_id"
    t.bigint "car_model_id"
    t.index ["address_id"], name: "index_cars_on_address_id"
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
    t.index ["driver_id"], name: "index_cars_on_driver_id"
  end

  create_table "rates", force: :cascade do |t|
    t.string "per"
    t.integer "price", default: 0
    t.bigint "car_id"
    t.index ["car_id"], name: "index_rates_on_car_id"
    t.index ["per", "price", "car_id"], name: "index_rates_on_per_and_price_and_car_id", unique: true
  end

  create_table "rentals", force: :cascade do |t|
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "star", null: false
    t.bigint "commenter_id", null: false
    t.index ["commenter_id"], name: "index_reviews_on_commenter_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.bigint "user_id"
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "user_name"
    t.string "encrypted_password"
    t.boolean "is_active", default: true
    t.boolean "is_locked", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_sent_at", default: "2018-06-01 14:33:06"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "car_attributes", "cars"
  add_foreign_key "cars", "addresses"
  add_foreign_key "cars", "car_models"
  add_foreign_key "cars", "users", column: "driver_id"
  add_foreign_key "rates", "cars"
  add_foreign_key "reviews", "users", column: "commenter_id"
  add_foreign_key "tokens", "users"
end
