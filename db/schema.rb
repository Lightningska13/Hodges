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

ActiveRecord::Schema.define(:version => 20120518132839) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "blurb"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "events", :force => true do |t|
    t.string   "event_type"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "title"
    t.text     "blurb"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "eventpic_file_name"
    t.integer  "eventpic_file_size"
    t.string   "eventpic_content_type"
  end

  create_table "product_cats", :force => true do |t|
    t.string   "cat_name"
    t.string   "catpic_file_name"
    t.integer  "catpic_file_size"
    t.string   "catpic_content_type"
    t.boolean  "featured"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.string   "pic_file_name"
    t.integer  "pic_file_size"
    t.string   "pic_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_cat_id"
    t.string   "pic2_file_name"
    t.integer  "pic2_file_size"
    t.string   "pic2_content_type"
    t.string   "item_number"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                             :null => false
    t.string   "name",                              :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.string   "perishable_token",                  :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "admin_level",        :default => 5
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
