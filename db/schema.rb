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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121121145245) do

  create_table "wp_annotation", :force => true do |t|
    t.string   "text"
    t.string   "bubble_style"
    t.string   "formatting_options"
    t.float    "xpos_percent"
    t.float    "ypos_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "panel_id"
  end

  add_index "wp_annotation", ["panel_id"], :name => "index_wp_annotation_on_panel_id"

  create_table "wp_comic", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "wp_comic", ["group_id"], :name => "index_wp_comic_on_group_id"

  create_table "wp_group", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organisation_id"
    t.string   "hashid"
  end

  add_index "wp_group", ["organisation_id"], :name => "index_wp_group_on_organisation_id"

  create_table "wp_organisation", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wp_panel", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comic_id"
  end

  add_index "wp_panel", ["comic_id"], :name => "index_wp_panel_on_comic_id"

  create_table "wp_photo", :force => true do |t|
    t.string   "description"
    t.string   "place"
    t.integer  "width"
    t.integer  "height"
    t.string   "fmt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "wp_photo", ["group_id"], :name => "index_wp_photo_on_group_id"

  create_table "wp_resource", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "image_place"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "theme_id"
  end

  add_index "wp_resource", ["theme_id"], :name => "index_wp_resource_on_theme_id"

  create_table "wp_theme", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organisation_id"
  end

  add_index "wp_theme", ["organisation_id"], :name => "index_wp_theme_on_organisation_id"

  create_table "wp_user", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.string   "state",                                   :default => "invited"
    t.datetime "key_timestamp"
  end

  add_index "wp_user", ["group_id"], :name => "index_wp_user_on_group_id"
  add_index "wp_user", ["state"], :name => "index_wp_user_on_state"

end