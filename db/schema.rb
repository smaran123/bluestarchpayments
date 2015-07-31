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

ActiveRecord::Schema.define(version: 20150730173950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payments", force: :cascade do |t|
    t.string   "product_name"
    t.string   "customer_name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "post_code"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.string   "card_number"
    t.decimal  "amount",        precision: 8, scale: 2
    t.boolean  "is_signed",                             default: false
    t.string   "token"
    t.string   "slug"
    t.string   "card_expiry"
    t.string   "card_cvv"
    t.date     "date_of_birth"
    t.string   "ip_address"
    t.integer  "user_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "signs", force: :cascade do |t|
    t.integer  "payment_id"
    t.json     "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
