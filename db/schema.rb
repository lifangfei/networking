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

ActiveRecord::Schema.define(version: 20170514155435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "title"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.string   "industry"
    t.string   "linkedin"
    t.text     "notes"
    t.integer  "tier"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.date     "date"
    t.string   "method_of_contact"
    t.string   "location"
    t.text     "professional_discussion"
    t.text     "casual_discussion"
    t.text     "notes"
    t.date     "follow_up"
    t.text     "follow_up_topics"
    t.integer  "connection_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "tier"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_hash"
    t.string   "email",         null: false
    t.string   "phone_number",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
