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

ActiveRecord::Schema[7.0].define(version: 2022_09_06_164458) do
  create_table "floors", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", precision: nil, null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "names", force: :cascade do |t|
    t.string "add"
    t.string "demo"
    t.integer "user_id", null: false
    t.integer "floor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_names_on_floor_id"
    t.index ["user_id"], name: "index_names_on_user_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string "car_number"
    t.string "car_color"
    t.datetime "in_time", precision: nil
    t.datetime "out_time", precision: nil
    t.string "status"
    t.decimal "price"
    t.integer "floor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "slot_number"
    t.index ["floor_id"], name: "index_slots_on_floor_id"
  end

  create_table "user_histories", force: :cascade do |t|
    t.string "car_number"
    t.string "car_color"
    t.string "in_time"
    t.string "out_time"
    t.string "status"
    t.decimal "price"
    t.integer "floor_id"
    t.integer "user_id"
    t.string "slot_number"
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
    t.string "role", default: "user"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "names", "floors"
  add_foreign_key "names", "users"
  add_foreign_key "slots", "floors"
end
