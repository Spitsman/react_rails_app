# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180204073021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "request_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: :cascade do |t|
    t.date "date"
  end

  create_table "requests", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "body",       null: false
    t.decimal  "amount",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests_users", id: false, force: :cascade do |t|
    t.integer "request_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "requests_users", ["request_id", "user_id"], name: "index_requests_users_on_request_id_and_user_id", unique: true, using: :btree

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.boolean "favorite"
  end

  create_table "teams_in_matches", force: :cascade do |t|
    t.integer "team_id"
    t.integer "match_id"
    t.integer "score"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             null: false
    t.string   "first_name",                        null: false
    t.string   "last_name",                         null: false
    t.boolean  "admin",             default: false, null: false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "email_confirmed",   default: false
    t.string   "confirm_token"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
