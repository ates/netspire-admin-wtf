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

ActiveRecord::Schema.define(:version => 20110831134033) do

  create_table "accounts", :force => true do |t|
    t.string   "contract",                                                     :null => false
    t.string   "login",                                                        :null => false
    t.string   "password",                                                     :null => false
    t.decimal  "balance",    :precision => 20, :scale => 10, :default => 0.0
    t.boolean  "active",                                     :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "login",                                             :null => false
    t.string   "email"
    t.string   "encrypted_password",  :limit => 128
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["login"], :name => "index_admins_on_login", :unique => true

  create_table "assigned_radius_replies", :force => true do |t|
    t.integer  "target_id",       :null => false
    t.string   "target_type",     :null => false
    t.integer  "radius_reply_id", :null => false
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assigned_radius_reply_groups", :force => true do |t|
    t.integer  "target_id",             :null => false
    t.integer  "radius_reply_group_id", :null => false
    t.string   "target_type",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iptraffic_sessions", :force => true do |t|
    t.integer  "account_id",                                                                 :null => false
    t.string   "sid",         :limit => 64,                                                  :null => false
    t.string   "ip"
    t.integer  "octets_in",   :limit => 8,                                  :default => 0,   :null => false
    t.integer  "octets_out",  :limit => 8,                                  :default => 0,   :null => false
    t.decimal  "amount",                    :precision => 20, :scale => 10, :default => 0.0, :null => false
    t.datetime "started_at",                                                                 :null => false
    t.datetime "finished_at"
    t.datetime "updated_at"
    t.boolean  "expired"
  end

  create_table "radius_replies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "radius_reply_groups", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "title",                         :null => false
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "account_id",                                :null => false
    t.decimal  "amount",     :precision => 12, :scale => 2, :null => false
    t.integer  "code",                                      :null => false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
