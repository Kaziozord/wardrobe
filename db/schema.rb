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

ActiveRecord::Schema.define(version: 20160105022544) do

  create_table "item_sets", force: :cascade do |t|
    t.integer "item_id"
    t.string  "name"
    t.string  "description"
  end

  add_index "item_sets", ["item_id"], name: "index_item_sets_on_item_id"

  create_table "item_sets_items", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "item_set_id"
  end

  add_index "item_sets_items", ["item_id"], name: "index_item_sets_items_on_item_id"
  add_index "item_sets_items", ["item_set_id"], name: "index_item_sets_items_on_item_set_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "wash_count"
    t.boolean  "in_laundry",  default: false
    t.integer  "item_set_id"
  end

  create_table "items_states", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "state_id"
  end

  add_index "items_states", ["item_id"], name: "index_items_states_on_item_id"
  add_index "items_states", ["state_id"], name: "index_items_states_on_state_id"

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "property_id"
  end

  create_table "values", force: :cascade do |t|
    t.integer "property_id"
    t.integer "item_id"
    t.integer "value"
  end

  add_index "values", ["item_id"], name: "index_values_on_item_id"
  add_index "values", ["property_id"], name: "index_values_on_property_id"

end
