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

ActiveRecord::Schema.define(version: 20150808232258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "downcase_name"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "charity_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "charities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "mailing_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "password_hash"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "downcase_name"
  end

  create_table "interests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "wishlist_id"
    t.string   "name"
    t.integer  "creation_price"
    t.integer  "current_price"
    t.string   "priority"
    t.integer  "qty_requested"
    t.integer  "qty_received"
    t.string   "rating"
    t.integer  "number_ratings"
    t.string   "comments"
    t.datetime "date_added"
    t.string   "picture_url"
    t.string   "link"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_charities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "charity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "charity_id"
    t.string   "name"
    t.string   "link"
    t.string   "original_link"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
