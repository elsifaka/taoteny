# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080611100631) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "language_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domain_metas", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "language_id", :limit => 11
    t.integer  "domain_id",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", :force => true do |t|
    t.integer  "parent_id",  :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.integer  "language_id", :limit => 11
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "code_ISO_639_1"
    t.string   "code_ISO_639_2"
    t.string   "code_ISO_639_3"
    t.string   "code_RFC_3066"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "ui_lang",                   :limit => 5
    t.string   "src_lang",                  :limit => 5
    t.string   "tgt_lang",                  :limit => 5
  end

end
