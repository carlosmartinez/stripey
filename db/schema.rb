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

ActiveRecord::Schema.define(version: 20150218123616) do

  create_table "line_items", force: :cascade do |t|
    t.decimal  "cost"
    t.integer  "producer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "line_items", ["producer_id"], name: "index_line_items_on_producer_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "line_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "transfer_id"
  end

  add_index "payments", ["line_item_id"], name: "index_payments_on_line_item_id"

  create_table "producers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.string   "recipient_id"
  end

end
