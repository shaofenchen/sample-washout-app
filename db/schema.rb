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

ActiveRecord::Schema.define(:version => 20120709224406) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "tax",        :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "price",      :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "total",      :precision => 8, :scale => 2, :default => 0.0
    t.integer  "quantity"
    t.string   "sku"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.string   "buyer"
    t.string   "buyer_email"
    t.string   "buyer_name"
    t.string   "order_number"
    t.string   "platform"
    t.datetime "order_date"
    t.decimal  "tax",              :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "sales_price",      :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "total",            :precision => 8, :scale => 2, :default => 0.0
    t.string   "status"
    t.text     "notes"
    t.string   "shipping_method"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "phone"
    t.datetime "ship_date"
    t.string   "carrier"
    t.string   "tracking_number"
    t.integer  "quickbook_sn"
    t.string   "quickbook_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "model"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
