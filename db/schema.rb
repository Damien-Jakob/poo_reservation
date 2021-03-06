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

ActiveRecord::Schema.define(version: 2020_04_09_084207) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.bigint "created_by_id", null: false
    t.bigint "created_for_id"
    t.datetime "start_at", precision: 6, null: false
    t.datetime "end_at", precision: 6, null: false
    t.string "type"
    t.index ["created_by_id"], name: "index_bookings_on_created_by_id"
    t.index ["created_for_id"], name: "index_bookings_on_created_for_id"
  end

  create_table "bookings_attendants", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "bookings_reservable_items", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "reservable_item_id", null: false
  end

  create_table "furniture_responsibles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "reservable_item_id", null: false
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
  end

  create_table "groups_members", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "groups_reservable_items", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "reservable_item_id", null: false
  end

  create_table "reservable_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type"
    t.string "name", limit: 50, null: false
    t.string "manual"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firstname", limit: 50, null: false
    t.string "lastname", limit: 50, null: false
  end

  add_foreign_key "bookings", "users", column: "created_by_id"
  add_foreign_key "bookings", "users", column: "created_for_id"
end
