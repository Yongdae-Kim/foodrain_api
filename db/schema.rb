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

ActiveRecord::Schema.define(version: 20160201111236) do

  create_table "common_codes", primary_key: "common_code_id", force: :cascade do |t|
    t.string   "main_code"
    t.integer  "detail_id"
    t.string   "name_kor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", primary_key: "image_id", force: :cascade do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "regions", primary_key: "region_id", force: :cascade do |t|
    t.string   "do"
    t.string   "gu"
    t.string   "dong"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", primary_key: "review_id", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "user_id"
    t.text     "detail"
    t.float    "grade",      default: 4.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["store_id"], name: "index_reviews_on_store_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "store_menus", primary_key: "store_menu_id", force: :cascade do |t|
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_menus_on_store_id"
  end

  create_table "store_owners", primary_key: "store_owner_id", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", primary_key: "store_id", force: :cascade do |t|
    t.integer  "store_owner_id"
    t.integer  "category_id"
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "phone"
    t.text     "detail"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "holiday"
    t.integer  "reviews_count",  default: 0
    t.float    "grade_total",    default: 0.0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["store_owner_id"], name: "index_stores_on_store_owner_id"
  end

  create_table "user_auths", primary_key: "user_auth_id", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_user_auths_on_user_id"
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "nickname"
    t.string   "phone"
    t.integer  "gender"
    t.integer  "reviews_count", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
