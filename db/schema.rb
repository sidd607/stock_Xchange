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

ActiveRecord::Schema.define(version: 20160406183404) do

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.integer  "user_id",    limit: 4
    t.string   "token",      limit: 255
    t.string   "secret",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter",  limit: 255
    t.text     "body",       limit: 65535
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "microposts", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.string   "code",          limit: 2,              null: false
    t.string   "name",          limit: 30,             null: false
    t.integer  "stock_type",    limit: 2,              null: false
    t.float    "current_price", limit: 24,             null: false
    t.float    "opening_price", limit: 24
    t.float    "day_high",      limit: 24
    t.float    "day_low",       limit: 24
    t.integer  "sold_count",    limit: 4,  default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "stock_id",         limit: 4
    t.float    "stock_value",      limit: 24
    t.integer  "stock_count",      limit: 4
    t.integer  "transaction_type", limit: 2,  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "portfolio_id",     limit: 4
    t.integer  "user_stock_id",    limit: 4
  end

  create_table "user_stocks", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "stock_id",    limit: 4
    t.integer  "stock_value", limit: 4
    t.integer  "stock_count", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                   limit: 255
    t.string   "image",                  limit: 255
    t.string   "username",               limit: 255
    t.datetime "date_of_birth"
    t.boolean  "is_female",                          default: false
    t.string   "avatar",                 limit: 255
    t.boolean  "admin"
    t.float    "net_worth",              limit: 24
    t.float    "balance",                limit: 24
    t.integer  "rank",                   limit: 4
    t.integer  "college_id",             limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "microposts", "users"
  add_foreign_key "posts", "users"
end
