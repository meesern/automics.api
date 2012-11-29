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

ActiveRecord::Schema.define(:version => 20121129135350) do

  create_table "wp_2_commentmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "comment_id", :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_2_commentmeta", ["comment_id"], :name => "comment_id"
  add_index "wp_2_commentmeta", ["meta_key"], :name => "meta_key"

  create_table "wp_2_comments", :primary_key => "comment_ID", :force => true do |t|
    t.integer  "comment_post_ID",      :limit => 8,   :default => 0,   :null => false
    t.text     "comment_author",       :limit => 255,                  :null => false
    t.string   "comment_author_email", :limit => 100, :default => "",  :null => false
    t.string   "comment_author_url",   :limit => 200, :default => "",  :null => false
    t.string   "comment_author_IP",    :limit => 100, :default => "",  :null => false
    t.datetime "comment_date",                                         :null => false
    t.datetime "comment_date_gmt",                                     :null => false
    t.text     "comment_content",                                      :null => false
    t.integer  "comment_karma",                       :default => 0,   :null => false
    t.string   "comment_approved",     :limit => 20,  :default => "1", :null => false
    t.string   "comment_agent",                       :default => "",  :null => false
    t.string   "comment_type",         :limit => 20,  :default => "",  :null => false
    t.integer  "comment_parent",       :limit => 8,   :default => 0,   :null => false
    t.integer  "user_id",              :limit => 8,   :default => 0,   :null => false
  end

  add_index "wp_2_comments", ["comment_approved", "comment_date_gmt"], :name => "comment_approved_date_gmt"
  add_index "wp_2_comments", ["comment_date_gmt"], :name => "comment_date_gmt"
  add_index "wp_2_comments", ["comment_parent"], :name => "comment_parent"
  add_index "wp_2_comments", ["comment_post_ID"], :name => "comment_post_ID"

  create_table "wp_2_links", :primary_key => "link_id", :force => true do |t|
    t.string   "link_url",                             :default => "",  :null => false
    t.string   "link_name",                            :default => "",  :null => false
    t.string   "link_image",                           :default => "",  :null => false
    t.string   "link_target",      :limit => 25,       :default => "",  :null => false
    t.string   "link_description",                     :default => "",  :null => false
    t.string   "link_visible",     :limit => 20,       :default => "Y", :null => false
    t.integer  "link_owner",       :limit => 8,        :default => 1,   :null => false
    t.integer  "link_rating",                          :default => 0,   :null => false
    t.datetime "link_updated",                                          :null => false
    t.string   "link_rel",                             :default => "",  :null => false
    t.text     "link_notes",       :limit => 16777215,                  :null => false
    t.string   "link_rss",                             :default => "",  :null => false
  end

  add_index "wp_2_links", ["link_visible"], :name => "link_visible"

  create_table "wp_2_m_communications", :force => true do |t|
    t.string    "subject",       :limit => 250
    t.text      "message"
    t.integer   "periodunit"
    t.string    "periodtype",    :limit => 5
    t.string    "periodprepost", :limit => 5
    t.timestamp "lastupdated"
    t.integer   "active",                       :default => 0
    t.integer   "periodstamp",   :limit => 8,   :default => 0
  end

  create_table "wp_2_m_levelmeta", :force => true do |t|
    t.integer   "level_id",   :limit => 8
    t.string    "meta_key",   :limit => 250
    t.text      "meta_value"
    t.timestamp "meta_stamp"
  end

  add_index "wp_2_m_levelmeta", ["level_id", "meta_key"], :name => "level_id", :unique => true

  create_table "wp_2_m_member_payments", :force => true do |t|
    t.integer  "member_id",      :limit => 8
    t.integer  "sub_id",         :limit => 8
    t.integer  "level_id",       :limit => 8
    t.integer  "level_order"
    t.datetime "paymentmade"
    t.datetime "paymentexpires"
  end

  create_table "wp_2_m_membership_levels", :force => true do |t|
    t.string  "level_title",  :limit => 250
    t.string  "level_slug",   :limit => 250
    t.integer "level_active",                :default => 0
    t.integer "level_count",  :limit => 8,   :default => 0
  end

  create_table "wp_2_m_membership_news", :force => true do |t|
    t.text     "newsitem"
    t.datetime "newsdate"
  end

  create_table "wp_2_m_membership_relationships", :primary_key => "rel_id", :force => true do |t|
    t.integer  "user_id",        :limit => 8,  :default => 0
    t.integer  "sub_id",         :limit => 8,  :default => 0
    t.integer  "level_id",       :limit => 8,  :default => 0
    t.datetime "startdate"
    t.datetime "updateddate"
    t.datetime "expirydate"
    t.integer  "order_instance", :limit => 8,  :default => 0
    t.string   "usinggateway",   :limit => 50, :default => "admin"
  end

  add_index "wp_2_m_membership_relationships", ["sub_id"], :name => "sub_id"
  add_index "wp_2_m_membership_relationships", ["user_id"], :name => "user_id"
  add_index "wp_2_m_membership_relationships", ["usinggateway"], :name => "usinggateway"

  create_table "wp_2_m_membership_rules", :id => false, :force => true do |t|
    t.integer "level_id",   :limit => 8,  :default => 0,  :null => false
    t.string  "rule_ive",   :limit => 20, :default => "", :null => false
    t.string  "rule_area",  :limit => 20, :default => "", :null => false
    t.text    "rule_value"
    t.integer "rule_order",               :default => 0
  end

  add_index "wp_2_m_membership_rules", ["rule_area"], :name => "rule_area"
  add_index "wp_2_m_membership_rules", ["rule_ive"], :name => "rule_ive"

  create_table "wp_2_m_ping_history", :force => true do |t|
    t.integer   "ping_id",     :limit => 8
    t.timestamp "ping_sent"
    t.text      "ping_info"
    t.text      "ping_return"
  end

  add_index "wp_2_m_ping_history", ["ping_id"], :name => "ping_id"

  create_table "wp_2_m_pings", :force => true do |t|
    t.string "pingname", :limit => 250
    t.string "pingurl",  :limit => 250
    t.text   "pinginfo"
    t.string "pingtype", :limit => 10
  end

  create_table "wp_2_m_subscription_transaction", :primary_key => "transaction_ID", :force => true do |t|
    t.integer  "transaction_subscription_ID", :limit => 8,  :default => 0, :null => false
    t.integer  "transaction_user_ID",         :limit => 8,  :default => 0, :null => false
    t.integer  "transaction_sub_ID",          :limit => 8,  :default => 0
    t.string   "transaction_paypal_ID",       :limit => 30
    t.string   "transaction_payment_type",    :limit => 20
    t.integer  "transaction_stamp",           :limit => 8,  :default => 0, :null => false
    t.integer  "transaction_total_amount",    :limit => 8
    t.string   "transaction_currency",        :limit => 35
    t.string   "transaction_status",          :limit => 35
    t.date     "transaction_duedate"
    t.string   "transaction_gateway",         :limit => 50
    t.text     "transaction_note"
    t.datetime "transaction_expires"
  end

  add_index "wp_2_m_subscription_transaction", ["transaction_gateway"], :name => "transaction_gateway"
  add_index "wp_2_m_subscription_transaction", ["transaction_subscription_ID"], :name => "transaction_subscription_ID"

  create_table "wp_2_m_subscriptionmeta", :force => true do |t|
    t.integer   "sub_id",     :limit => 8
    t.string    "meta_key",   :limit => 250
    t.text      "meta_value"
    t.timestamp "meta_stamp"
  end

  add_index "wp_2_m_subscriptionmeta", ["sub_id", "meta_key"], :name => "sub_id", :unique => true

  create_table "wp_2_m_subscriptions", :force => true do |t|
    t.string  "sub_name",        :limit => 200
    t.integer "sub_active",                     :default => 0
    t.integer "sub_public",                     :default => 0
    t.integer "sub_count",       :limit => 8,   :default => 0
    t.text    "sub_description"
  end

  create_table "wp_2_m_subscriptions_levels", :id => false, :force => true do |t|
    t.integer "sub_id",            :limit => 8
    t.integer "level_id",          :limit => 8
    t.integer "level_period"
    t.string  "sub_type",          :limit => 20
    t.integer "level_price",                     :default => 0
    t.string  "level_currency",    :limit => 5
    t.integer "level_order",       :limit => 8,  :default => 0
    t.string  "level_period_unit", :limit => 1,  :default => "d"
  end

  add_index "wp_2_m_subscriptions_levels", ["level_id"], :name => "level_id"
  add_index "wp_2_m_subscriptions_levels", ["sub_id"], :name => "sub_id"

  create_table "wp_2_m_urlgroups", :force => true do |t|
    t.string  "groupname",        :limit => 250
    t.text    "groupurls"
    t.integer "isregexp",                        :default => 0
    t.integer "stripquerystring",                :default => 0
  end

  create_table "wp_2_options", :primary_key => "option_id", :force => true do |t|
    t.string "option_name",  :limit => 64,         :default => "",    :null => false
    t.text   "option_value", :limit => 2147483647,                    :null => false
    t.string "autoload",     :limit => 20,         :default => "yes", :null => false
  end

  add_index "wp_2_options", ["option_name"], :name => "option_name", :unique => true

  create_table "wp_2_postmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "post_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_2_postmeta", ["meta_key"], :name => "meta_key"
  add_index "wp_2_postmeta", ["post_id"], :name => "post_id"

  create_table "wp_2_posts", :primary_key => "ID", :force => true do |t|
    t.integer  "post_author",           :limit => 8,          :default => 0,         :null => false
    t.datetime "post_date",                                                          :null => false
    t.datetime "post_date_gmt",                                                      :null => false
    t.text     "post_content",          :limit => 2147483647,                        :null => false
    t.text     "post_title",                                                         :null => false
    t.text     "post_excerpt",                                                       :null => false
    t.string   "post_status",           :limit => 20,         :default => "publish", :null => false
    t.string   "comment_status",        :limit => 20,         :default => "open",    :null => false
    t.string   "ping_status",           :limit => 20,         :default => "open",    :null => false
    t.string   "post_password",         :limit => 20,         :default => "",        :null => false
    t.string   "post_name",             :limit => 200,        :default => "",        :null => false
    t.text     "to_ping",                                                            :null => false
    t.text     "pinged",                                                             :null => false
    t.datetime "post_modified",                                                      :null => false
    t.datetime "post_modified_gmt",                                                  :null => false
    t.text     "post_content_filtered", :limit => 2147483647,                        :null => false
    t.integer  "post_parent",           :limit => 8,          :default => 0,         :null => false
    t.string   "guid",                                        :default => "",        :null => false
    t.integer  "menu_order",                                  :default => 0,         :null => false
    t.string   "post_type",             :limit => 20,         :default => "post",    :null => false
    t.string   "post_mime_type",        :limit => 100,        :default => "",        :null => false
    t.integer  "comment_count",         :limit => 8,          :default => 0,         :null => false
  end

  add_index "wp_2_posts", ["post_author"], :name => "post_author"
  add_index "wp_2_posts", ["post_name"], :name => "post_name"
  add_index "wp_2_posts", ["post_parent"], :name => "post_parent"
  add_index "wp_2_posts", ["post_type", "post_status", "post_date", "ID"], :name => "type_status_date"

  create_table "wp_2_term_relationships", :id => false, :force => true do |t|
    t.integer "object_id",        :limit => 8, :default => 0, :null => false
    t.integer "term_taxonomy_id", :limit => 8, :default => 0, :null => false
    t.integer "term_order",                    :default => 0, :null => false
  end

  add_index "wp_2_term_relationships", ["term_taxonomy_id"], :name => "term_taxonomy_id"

  create_table "wp_2_term_taxonomy", :primary_key => "term_taxonomy_id", :force => true do |t|
    t.integer "term_id",     :limit => 8,          :default => 0,  :null => false
    t.string  "taxonomy",    :limit => 32,         :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.integer "parent",      :limit => 8,          :default => 0,  :null => false
    t.integer "count",       :limit => 8,          :default => 0,  :null => false
  end

  add_index "wp_2_term_taxonomy", ["taxonomy"], :name => "taxonomy"
  add_index "wp_2_term_taxonomy", ["term_id", "taxonomy"], :name => "term_id_taxonomy", :unique => true

  create_table "wp_2_terms", :primary_key => "term_id", :force => true do |t|
    t.string  "name",       :limit => 200, :default => "", :null => false
    t.string  "slug",       :limit => 200, :default => "", :null => false
    t.integer "term_group", :limit => 8,   :default => 0,  :null => false
  end

  add_index "wp_2_terms", ["name"], :name => "name"
  add_index "wp_2_terms", ["slug"], :name => "slug", :unique => true

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

  create_table "wp_blog_versions", :primary_key => "blog_id", :force => true do |t|
    t.string   "db_version",   :limit => 20, :default => "", :null => false
    t.datetime "last_updated",                               :null => false
  end

  add_index "wp_blog_versions", ["db_version"], :name => "db_version"

  create_table "wp_blogs", :primary_key => "blog_id", :force => true do |t|
    t.integer  "site_id",      :limit => 8,   :default => 0,   :null => false
    t.string   "domain",       :limit => 200, :default => "",  :null => false
    t.string   "path",         :limit => 100, :default => "",  :null => false
    t.datetime "registered",                                   :null => false
    t.datetime "last_updated",                                 :null => false
    t.integer  "public",       :limit => 1,   :default => 1,   :null => false
    t.string   "archived",     :limit => 0,   :default => "0", :null => false
    t.integer  "mature",       :limit => 1,   :default => 0,   :null => false
    t.integer  "spam",         :limit => 1,   :default => 0,   :null => false
    t.integer  "deleted",      :limit => 1,   :default => 0,   :null => false
    t.integer  "lang_id",                     :default => 0,   :null => false
  end

  add_index "wp_blogs", ["domain", "path"], :name => "domain", :length => {"domain"=>"50", "path"=>"5"}
  add_index "wp_blogs", ["lang_id"], :name => "lang_id"

  create_table "wp_comic", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "wp_comic", ["group_id"], :name => "index_wp_comic_on_group_id"

  create_table "wp_commentmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "comment_id", :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_commentmeta", ["comment_id"], :name => "comment_id"
  add_index "wp_commentmeta", ["meta_key"], :name => "meta_key"

  create_table "wp_comments", :primary_key => "comment_ID", :force => true do |t|
    t.integer  "comment_post_ID",      :limit => 8,   :default => 0,   :null => false
    t.text     "comment_author",       :limit => 255,                  :null => false
    t.string   "comment_author_email", :limit => 100, :default => "",  :null => false
    t.string   "comment_author_url",   :limit => 200, :default => "",  :null => false
    t.string   "comment_author_IP",    :limit => 100, :default => "",  :null => false
    t.datetime "comment_date",                                         :null => false
    t.datetime "comment_date_gmt",                                     :null => false
    t.text     "comment_content",                                      :null => false
    t.integer  "comment_karma",                       :default => 0,   :null => false
    t.string   "comment_approved",     :limit => 20,  :default => "1", :null => false
    t.string   "comment_agent",                       :default => "",  :null => false
    t.string   "comment_type",         :limit => 20,  :default => "",  :null => false
    t.integer  "comment_parent",       :limit => 8,   :default => 0,   :null => false
    t.integer  "user_id",              :limit => 8,   :default => 0,   :null => false
  end

  add_index "wp_comments", ["comment_approved", "comment_date_gmt"], :name => "comment_approved_date_gmt"
  add_index "wp_comments", ["comment_date_gmt"], :name => "comment_date_gmt"
  add_index "wp_comments", ["comment_parent"], :name => "comment_parent"
  add_index "wp_comments", ["comment_post_ID"], :name => "comment_post_ID"

  create_table "wp_group", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organisation_id"
    t.string   "hashid"
  end

  add_index "wp_group", ["hashid"], :name => "index_wp_group_on_hashid"
  add_index "wp_group", ["name"], :name => "index_wp_group_on_name"
  add_index "wp_group", ["organisation_id"], :name => "index_wp_group_on_organisation_id"

  create_table "wp_links", :primary_key => "link_id", :force => true do |t|
    t.string   "link_url",                             :default => "",  :null => false
    t.string   "link_name",                            :default => "",  :null => false
    t.string   "link_image",                           :default => "",  :null => false
    t.string   "link_target",      :limit => 25,       :default => "",  :null => false
    t.string   "link_description",                     :default => "",  :null => false
    t.string   "link_visible",     :limit => 20,       :default => "Y", :null => false
    t.integer  "link_owner",       :limit => 8,        :default => 1,   :null => false
    t.integer  "link_rating",                          :default => 0,   :null => false
    t.datetime "link_updated",                                          :null => false
    t.string   "link_rel",                             :default => "",  :null => false
    t.text     "link_notes",       :limit => 16777215,                  :null => false
    t.string   "link_rss",                             :default => "",  :null => false
  end

  add_index "wp_links", ["link_visible"], :name => "link_visible"

  create_table "wp_m_communications", :force => true do |t|
    t.string    "subject",       :limit => 250
    t.text      "message"
    t.integer   "periodunit"
    t.string    "periodtype",    :limit => 5
    t.string    "periodprepost", :limit => 5
    t.timestamp "lastupdated"
    t.integer   "active",                       :default => 0
    t.integer   "periodstamp",   :limit => 8,   :default => 0
  end

  create_table "wp_m_levelmeta", :force => true do |t|
    t.integer   "level_id",   :limit => 8
    t.string    "meta_key",   :limit => 250
    t.text      "meta_value"
    t.timestamp "meta_stamp"
  end

  add_index "wp_m_levelmeta", ["level_id", "meta_key"], :name => "level_id", :unique => true

  create_table "wp_m_member_payments", :force => true do |t|
    t.integer  "member_id",      :limit => 8
    t.integer  "sub_id",         :limit => 8
    t.integer  "level_id",       :limit => 8
    t.integer  "level_order"
    t.datetime "paymentmade"
    t.datetime "paymentexpires"
  end

  create_table "wp_m_membership_levels", :force => true do |t|
    t.string  "level_title",  :limit => 250
    t.string  "level_slug",   :limit => 250
    t.integer "level_active",                :default => 0
    t.integer "level_count",  :limit => 8,   :default => 0
  end

  create_table "wp_m_membership_news", :force => true do |t|
    t.text     "newsitem"
    t.datetime "newsdate"
  end

  create_table "wp_m_membership_relationships", :primary_key => "rel_id", :force => true do |t|
    t.integer  "user_id",        :limit => 8,  :default => 0
    t.integer  "sub_id",         :limit => 8,  :default => 0
    t.integer  "level_id",       :limit => 8,  :default => 0
    t.datetime "startdate"
    t.datetime "updateddate"
    t.datetime "expirydate"
    t.integer  "order_instance", :limit => 8,  :default => 0
    t.string   "usinggateway",   :limit => 50, :default => "admin"
  end

  add_index "wp_m_membership_relationships", ["sub_id"], :name => "sub_id"
  add_index "wp_m_membership_relationships", ["user_id"], :name => "user_id"
  add_index "wp_m_membership_relationships", ["usinggateway"], :name => "usinggateway"

  create_table "wp_m_membership_rules", :id => false, :force => true do |t|
    t.integer "level_id",   :limit => 8,  :default => 0,  :null => false
    t.string  "rule_ive",   :limit => 20, :default => "", :null => false
    t.string  "rule_area",  :limit => 20, :default => "", :null => false
    t.text    "rule_value"
    t.integer "rule_order",               :default => 0
  end

  add_index "wp_m_membership_rules", ["rule_area"], :name => "rule_area"
  add_index "wp_m_membership_rules", ["rule_ive"], :name => "rule_ive"

  create_table "wp_m_ping_history", :force => true do |t|
    t.integer   "ping_id",     :limit => 8
    t.timestamp "ping_sent"
    t.text      "ping_info"
    t.text      "ping_return"
  end

  add_index "wp_m_ping_history", ["ping_id"], :name => "ping_id"

  create_table "wp_m_pings", :force => true do |t|
    t.string "pingname", :limit => 250
    t.string "pingurl",  :limit => 250
    t.text   "pinginfo"
    t.string "pingtype", :limit => 10
  end

  create_table "wp_m_subscription_transaction", :primary_key => "transaction_ID", :force => true do |t|
    t.integer  "transaction_subscription_ID", :limit => 8,  :default => 0, :null => false
    t.integer  "transaction_user_ID",         :limit => 8,  :default => 0, :null => false
    t.integer  "transaction_sub_ID",          :limit => 8,  :default => 0
    t.string   "transaction_paypal_ID",       :limit => 30
    t.string   "transaction_payment_type",    :limit => 20
    t.integer  "transaction_stamp",           :limit => 8,  :default => 0, :null => false
    t.integer  "transaction_total_amount",    :limit => 8
    t.string   "transaction_currency",        :limit => 35
    t.string   "transaction_status",          :limit => 35
    t.date     "transaction_duedate"
    t.string   "transaction_gateway",         :limit => 50
    t.text     "transaction_note"
    t.datetime "transaction_expires"
  end

  add_index "wp_m_subscription_transaction", ["transaction_gateway"], :name => "transaction_gateway"
  add_index "wp_m_subscription_transaction", ["transaction_subscription_ID"], :name => "transaction_subscription_ID"

  create_table "wp_m_subscriptionmeta", :force => true do |t|
    t.integer   "sub_id",     :limit => 8
    t.string    "meta_key",   :limit => 250
    t.text      "meta_value"
    t.timestamp "meta_stamp"
  end

  add_index "wp_m_subscriptionmeta", ["sub_id", "meta_key"], :name => "sub_id", :unique => true

  create_table "wp_m_subscriptions", :force => true do |t|
    t.string  "sub_name",        :limit => 200
    t.integer "sub_active",                     :default => 0
    t.integer "sub_public",                     :default => 0
    t.integer "sub_count",       :limit => 8,   :default => 0
    t.text    "sub_description"
  end

  create_table "wp_m_subscriptions_levels", :id => false, :force => true do |t|
    t.integer "sub_id",            :limit => 8
    t.integer "level_id",          :limit => 8
    t.integer "level_period"
    t.string  "sub_type",          :limit => 20
    t.integer "level_price",                     :default => 0
    t.string  "level_currency",    :limit => 5
    t.integer "level_order",       :limit => 8,  :default => 0
    t.string  "level_period_unit", :limit => 1,  :default => "d"
  end

  add_index "wp_m_subscriptions_levels", ["level_id"], :name => "level_id"
  add_index "wp_m_subscriptions_levels", ["sub_id"], :name => "sub_id"

  create_table "wp_m_urlgroups", :force => true do |t|
    t.string  "groupname",        :limit => 250
    t.text    "groupurls"
    t.integer "isregexp",                        :default => 0
    t.integer "stripquerystring",                :default => 0
  end

  create_table "wp_options", :primary_key => "option_id", :force => true do |t|
    t.string "option_name",  :limit => 64,         :default => "",    :null => false
    t.text   "option_value", :limit => 2147483647,                    :null => false
    t.string "autoload",     :limit => 20,         :default => "yes", :null => false
  end

  add_index "wp_options", ["option_name"], :name => "option_name", :unique => true

  create_table "wp_organisation", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wp_organisation", ["name"], :name => "index_wp_organisation_on_name"

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

  create_table "wp_postmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "post_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_postmeta", ["meta_key"], :name => "meta_key"
  add_index "wp_postmeta", ["post_id"], :name => "post_id"

  create_table "wp_posts", :primary_key => "ID", :force => true do |t|
    t.integer  "post_author",           :limit => 8,          :default => 0,         :null => false
    t.datetime "post_date",                                                          :null => false
    t.datetime "post_date_gmt",                                                      :null => false
    t.text     "post_content",          :limit => 2147483647,                        :null => false
    t.text     "post_title",                                                         :null => false
    t.text     "post_excerpt",                                                       :null => false
    t.string   "post_status",           :limit => 20,         :default => "publish", :null => false
    t.string   "comment_status",        :limit => 20,         :default => "open",    :null => false
    t.string   "ping_status",           :limit => 20,         :default => "open",    :null => false
    t.string   "post_password",         :limit => 20,         :default => "",        :null => false
    t.string   "post_name",             :limit => 200,        :default => "",        :null => false
    t.text     "to_ping",                                                            :null => false
    t.text     "pinged",                                                             :null => false
    t.datetime "post_modified",                                                      :null => false
    t.datetime "post_modified_gmt",                                                  :null => false
    t.text     "post_content_filtered", :limit => 2147483647,                        :null => false
    t.integer  "post_parent",           :limit => 8,          :default => 0,         :null => false
    t.string   "guid",                                        :default => "",        :null => false
    t.integer  "menu_order",                                  :default => 0,         :null => false
    t.string   "post_type",             :limit => 20,         :default => "post",    :null => false
    t.string   "post_mime_type",        :limit => 100,        :default => "",        :null => false
    t.integer  "comment_count",         :limit => 8,          :default => 0,         :null => false
  end

  add_index "wp_posts", ["post_author"], :name => "post_author"
  add_index "wp_posts", ["post_name"], :name => "post_name"
  add_index "wp_posts", ["post_parent"], :name => "post_parent"
  add_index "wp_posts", ["post_type", "post_status", "post_date", "ID"], :name => "type_status_date"

  create_table "wp_registration_log", :primary_key => "ID", :force => true do |t|
    t.string   "email",                         :default => "", :null => false
    t.string   "IP",              :limit => 30, :default => "", :null => false
    t.integer  "blog_id",         :limit => 8,  :default => 0,  :null => false
    t.datetime "date_registered",                               :null => false
  end

  add_index "wp_registration_log", ["IP"], :name => "IP"

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

  create_table "wp_signups", :id => false, :force => true do |t|
    t.string   "domain",         :limit => 200,        :default => "",    :null => false
    t.string   "path",           :limit => 100,        :default => "",    :null => false
    t.text     "title",          :limit => 2147483647,                    :null => false
    t.string   "user_login",     :limit => 60,         :default => "",    :null => false
    t.string   "user_email",     :limit => 100,        :default => "",    :null => false
    t.datetime "registered",                                              :null => false
    t.datetime "activated",                                               :null => false
    t.boolean  "active",                               :default => false, :null => false
    t.string   "activation_key", :limit => 50,         :default => "",    :null => false
    t.text     "meta",           :limit => 2147483647
  end

  add_index "wp_signups", ["activation_key"], :name => "activation_key"
  add_index "wp_signups", ["domain"], :name => "domain"

  create_table "wp_site", :force => true do |t|
    t.string "domain", :limit => 200, :default => "", :null => false
    t.string "path",   :limit => 100, :default => "", :null => false
  end

  add_index "wp_site", ["domain", "path"], :name => "domain"

  create_table "wp_sitemeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "site_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_sitemeta", ["meta_key"], :name => "meta_key"
  add_index "wp_sitemeta", ["site_id"], :name => "site_id"

  create_table "wp_term_relationships", :id => false, :force => true do |t|
    t.integer "object_id",        :limit => 8, :default => 0, :null => false
    t.integer "term_taxonomy_id", :limit => 8, :default => 0, :null => false
    t.integer "term_order",                    :default => 0, :null => false
  end

  add_index "wp_term_relationships", ["term_taxonomy_id"], :name => "term_taxonomy_id"

  create_table "wp_term_taxonomy", :primary_key => "term_taxonomy_id", :force => true do |t|
    t.integer "term_id",     :limit => 8,          :default => 0,  :null => false
    t.string  "taxonomy",    :limit => 32,         :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.integer "parent",      :limit => 8,          :default => 0,  :null => false
    t.integer "count",       :limit => 8,          :default => 0,  :null => false
  end

  add_index "wp_term_taxonomy", ["taxonomy"], :name => "taxonomy"
  add_index "wp_term_taxonomy", ["term_id", "taxonomy"], :name => "term_id_taxonomy", :unique => true

  create_table "wp_terms", :primary_key => "term_id", :force => true do |t|
    t.string  "name",       :limit => 200, :default => "", :null => false
    t.string  "slug",       :limit => 200, :default => "", :null => false
    t.integer "term_group", :limit => 8,   :default => 0,  :null => false
  end

  add_index "wp_terms", ["name"], :name => "name"
  add_index "wp_terms", ["slug"], :name => "slug", :unique => true

  create_table "wp_theme", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organisation_id"
  end

  add_index "wp_theme", ["organisation_id"], :name => "index_wp_theme_on_organisation_id"

  create_table "wp_usermeta", :primary_key => "umeta_id", :force => true do |t|
    t.integer "user_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_usermeta", ["meta_key"], :name => "meta_key"
  add_index "wp_usermeta", ["user_id"], :name => "user_id"

  create_table "wp_users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "user_login"
    t.string   "user_email"
    t.boolean  "administrator",                           :default => false
    t.datetime "user_registered"
    t.integer  "group_id"
    t.string   "state",                                   :default => "invited"
    t.datetime "key_timestamp"
    t.string   "user_nicename"
    t.string   "user_url"
    t.string   "user_activation_key"
    t.integer  "user_status"
    t.string   "display_name"
    t.boolean  "spam",                                    :default => false
    t.boolean  "deleted",                                 :default => false
    t.string   "user_pass"
  end

  add_index "wp_users", ["group_id"], :name => "index_wp_users_on_group_id"
  add_index "wp_users", ["state"], :name => "index_wp_users_on_state"

end
