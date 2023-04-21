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

ActiveRecord::Schema[7.0].define(version: 2023_01_07_172128) do
  create_table "launches", force: :cascade do |t|
    t.string "url"
    t.integer "launch_library_id"
    t.string "slug"
    t.string "name"
    t.string "net"
    t.string "window_end"
    t.string "window_start"
    t.boolean "inhold"
    t.boolean "tbdtime"
    t.boolean "tbddate"
    t.integer "probability"
    t.string "holdreason"
    t.string "failreason"
    t.string "hashtag"
    t.boolean "webcast_live"
    t.string "image"
    t.string "infographic"
    t.string "import_status"
    t.json "launch_service_provider"
    t.json "rocket"
    t.json "pad"
    t.json "mission"
    t.json "program"
    t.json "status"
    t.string "import_id"
    t.string "last_import_code"
    t.date "imported_t"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "key"
    t.date "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
