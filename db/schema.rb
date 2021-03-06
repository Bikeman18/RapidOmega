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

ActiveRecord::Schema.define(version: 20170126012421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_admins_on_name", unique: true, using: :btree
  end

  create_table "media", force: :cascade do |t|
    t.string   "media_id"
    t.jsonb    "content"
    t.string   "name"
    t.string   "url"
    t.integer  "update_time"
    t.integer  "media_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["media_id"], name: "index_media_on_media_id", unique: true, using: :btree
  end

  create_table "response_rules", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "rule_id"
    t.integer  "response_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "msgtype",    null: false
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string   "event",                     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",                      null: false
    t.string   "keyword"
    t.boolean  "fullmatch",  default: true
    t.index ["event", "keyword"], name: "index_rules_on_event_and_keyword", unique: true, using: :btree
  end

end
