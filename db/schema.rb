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

ActiveRecord::Schema.define(version: 20140519102718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "links", force: true do |t|
    t.string   "node_a"
    t.string   "node_b"
    t.integer  "direction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", force: true do |t|
    t.string   "name"
    t.integer  "node_id"
    t.integer  "link_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maps", ["link_id"], name: "index_maps_on_link_id", using: :btree
  add_index "maps", ["node_id"], name: "index_maps_on_node_id", using: :btree

  create_table "nodes", force: true do |t|
    t.integer  "service_id"
    t.integer  "type"
    t.integer  "evo_value"
    t.integer  "value_chain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service", force: true do |t|
    t.string   "name"
    t.text     "descriptor"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service", ["service_id"], name: "index_service_on_service_id", using: :btree

  create_table "similar_services", force: true do |t|
    t.integer  "services_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "similar_services", ["services_id"], name: "index_similar_services_on_services_id", using: :btree

  create_table "tokens", force: true do |t|
    t.integer  "user_id"
    t.string   "auth_code"
    t.string   "auth_token"
    t.string   "refresh_token"
    t.datetime "auth_life"
    t.datetime "refresh_life"
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
