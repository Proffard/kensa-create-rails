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

ActiveRecord::Schema.define(version: 20140528153245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "heroku_resources", force: true do |t|
    t.string   "email"
    t.string   "logplex_token"
    t.string   "plan"
    t.string   "region"
    t.string   "heroku_id"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "heroku_resources", ["email"], name: "index_heroku_resources_on_email", unique: true, using: :btree

end
