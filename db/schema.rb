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

ActiveRecord::Schema.define(version: 20131126083103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fines", force: true do |t|
    t.datetime "date"
    t.text     "description"
    t.string   "status"
    t.integer  "amount"
    t.integer  "offender_id"
    t.integer  "proposer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fines", ["offender_id"], name: "index_fines_on_offender_id", using: :btree
  add_index "fines", ["proposer_id"], name: "index_fines_on_proposer_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  create_table "votes", force: true do |t|
    t.integer  "voter_id"
    t.integer  "fine_id"
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["fine_id"], name: "index_votes_on_fine_id", using: :btree
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id", using: :btree

end
