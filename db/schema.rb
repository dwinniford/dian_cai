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

ActiveRecord::Schema.define(version: 2020_04_03_215953) do

  create_table "cuisines", force: :cascade do |t|
    t.string "chinese_name"
    t.string "pinyin_name"
    t.string "english_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cuisines_restaurants", id: false, force: :cascade do |t|
    t.integer "cuisine_id", null: false
    t.integer "restaurant_id", null: false
    t.index ["cuisine_id"], name: "index_cuisines_restaurants_on_cuisine_id"
    t.index ["restaurant_id"], name: "index_cuisines_restaurants_on_restaurant_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "chinese_name"
    t.string "pinyin_name"
    t.string "translated_name"
    t.text "description"
    t.string "ingredients"
    t.integer "spicy_level"
    t.integer "price"
    t.integer "calories"
    t.integer "restaurant_id"
    t.integer "translation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "english_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "chinese_name"
    t.string "pinyin_name"
    t.string "translated_name"
    t.integer "user_id"
    t.string "country"
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "street"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "translations", force: :cascade do |t|
    t.string "title"
    t.string "notes"
    t.integer "user_id"
    t.integer "restaurant_id"
    t.integer "language_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
