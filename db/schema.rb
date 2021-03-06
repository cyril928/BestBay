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

ActiveRecord::Schema.define(:version => 20131206085853) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "biddings", :force => true do |t|
    t.integer  "item_id"
    t.integer  "bidder_id"
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.string   "description"
    t.string   "condition"
    t.string   "duration"
    t.integer  "price"
    t.integer  "user_id"
    t.integer  "total_quantity"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "product_file_name"
    t.string   "product_content_type"
    t.integer  "product_file_size"
    t.datetime "product_updated_at"
    t.integer  "quantity"
    t.integer  "active"
    t.integer  "average_rating"
    t.integer  "is_advertisement"
  end

  create_table "rating_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "seller_id"
    t.integer  "item_id"
    t.integer  "rating"
    t.string   "comment"
    t.integer  "is_seller_rating"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "revenues", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "name"
    t.string   "card_number"
    t.string   "expiry_date"
    t.string   "address"
    t.integer  "amount"
    t.integer  "is_transaction_revenue"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "shopping_carts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.text     "item_list",  :limit => 255
  end

  create_table "transactions", :force => true do |t|
    t.string   "name"
    t.string   "card_number"
    t.string   "expiry_date"
    t.string   "address"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "user_id"
    t.text     "item_list",            :limit => 255
    t.integer  "reward_points_earned"
    t.integer  "total_amount"
    t.integer  "reward_points_spent"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "active"
    t.integer  "reward_points"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
