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

ActiveRecord::Schema.define(version: 20150126004705) do

  create_table "invitations", force: :cascade do |t|
    t.string   "name"
    t.integer  "party_size"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invitations", ["name"], name: "index_invitations_on_name", unique: true

  create_table "responses", force: :cascade do |t|
    t.integer  "party_size"
    t.text     "comment"
    t.text     "food_restrictions"
    t.string   "responded_with"
    t.integer  "invitations_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "responses", ["invitations_id"], name: "index_responses_on_invitations_id"

end