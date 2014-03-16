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

ActiveRecord::Schema.define(version: 20140316072632) do

  create_table "banners", force: true do |t|
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.boolean  "activate",            default: true
    t.integer  "last_updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "caption"
    t.string   "url"
    t.boolean  "featured"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "page_banners", force: true do |t|
    t.integer  "banner_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "page_title"
    t.string   "page_subtitle"
    t.string   "browser_title"
    t.string   "page_url"
    t.text     "body"
    t.text     "short_body"
    t.string   "link_forward"
    t.integer  "page_id"
    t.integer  "last_updated_by"
    t.date     "publish_date"
    t.boolean  "is_skip",         default: false
    t.boolean  "activate",        default: false
    t.boolean  "show_in_menu",    default: false
    t.integer  "display_order",   default: 0
    t.text     "page_scripts"
    t.text     "page_styles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_permissions", force: true do |t|
    t.integer  "role_id"
    t.integer  "user_permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "code",            limit: 20
    t.string   "name",            limit: 100
    t.boolean  "is_active",                   default: true
    t.integer  "last_updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["code", "name"], name: "role_code_name_index", using: :btree

  create_table "user_permissions", force: true do |t|
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "role_id"
    t.string   "gender",        limit: 6
    t.text     "address"
    t.string   "phone"
    t.date     "birthdate"
    t.boolean  "status"
    t.date     "last_login_at"
    t.string   "last_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["first_name", "last_name", "email"], name: "user_info_index", using: :btree

end
