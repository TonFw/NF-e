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

ActiveRecord::Schema.define(version: 20160114214331) do

  create_table "additional_infos", force: :cascade do |t|
    t.string   "key",                       limit: 55,    null: false
    t.text     "value",                     limit: 65535
    t.integer  "parent_additional_info_id", limit: 4
    t.integer  "invoice_id",                limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "additional_infos", ["invoice_id"], name: "index_additional_infos_on_invoice_id", using: :btree

  create_table "batches", force: :cascade do |t|
    t.boolean  "processed"
    t.string   "attached",   limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "nfe_code",   limit: 75,    null: false
    t.text     "body",       limit: 65535
    t.integer  "batch_id",   limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "invoices", ["batch_id"], name: "index_invoices_on_batch_id", using: :btree

  add_foreign_key "additional_infos", "invoices"
  add_foreign_key "invoices", "batches"
end
