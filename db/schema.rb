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

ActiveRecord::Schema[7.0].define(version: 2023_08_21_143332) do
  create_table "locations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude", precision: 12, scale: 8
    t.decimal "longitude", precision: 12, scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timezone"
  end

  create_table "weather_forecasts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "date"
    t.datetime "sunrise"
    t.datetime "sunset"
    t.decimal "apparent_temperature_max", precision: 3, scale: 1
    t.decimal "apparent_temperature_min", precision: 3, scale: 1
    t.integer "precipitation_probability_max"
    t.integer "weathercode"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_weather_forecasts_on_location_id"
  end

  add_foreign_key "weather_forecasts", "locations"
end
