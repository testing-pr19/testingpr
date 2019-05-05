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

ActiveRecord::Schema.define(version: 2019_05_05_121420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_records", force: :cascade do |t|
    t.string "timing"
    t.string "class_name"
    t.string "slot"
    t.integer "uploaded_file_id"
    t.integer "invigilator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invigilators", force: :cascade do |t|
    t.string "name"
    t.string "invigilator_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.string "from"
    t.string "from_am_pm"
    t.string "to"
    t.string "to_am_pm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploaded_files", force: :cascade do |t|
    t.string "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
