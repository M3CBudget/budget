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

ActiveRecord::Schema.define(version: 20150218172155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "number"
    t.string   "bic"
    t.string   "name"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "articles", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.boolean  "active"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id", using: :btree

  create_table "baskets", force: true do |t|
    t.string   "notice"
    t.decimal  "amount"
    t.binary   "document"
    t.integer  "user_id"
    t.integer  "payment_id"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "baskets", ["payment_id"], name: "index_baskets_on_payment_id", using: :btree
  add_index "baskets", ["user_id"], name: "index_baskets_on_user_id", using: :btree
  add_index "baskets", ["vendor_id"], name: "index_baskets_on_vendor_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "notice"
    t.boolean  "active"
    t.boolean  "income"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "basket_id"
    t.integer  "category_id"
    t.integer  "article_id"
    t.integer  "user_id"
    t.string   "name"
    t.decimal  "quantity"
    t.decimal  "price"
    t.string   "notice"
    t.boolean  "income"
    t.integer  "period"
    t.date     "launch"
    t.date     "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["article_id"], name: "index_items_on_article_id", using: :btree
  add_index "items", ["basket_id"], name: "index_items_on_basket_id", using: :btree
  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "payments", force: true do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["account_id"], name: "index_payments_on_account_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.binary   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
