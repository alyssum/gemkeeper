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

ActiveRecord::Schema.define(version: 20131125004716) do

  create_table "games", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_players"
  end

  create_table "participations", force: true do |t|
    t.integer  "session_id"
    t.integer  "player_id"
    t.integer  "role_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true
  add_index "players", ["name"], name: "index_players_on_name", unique: true

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "game_id"
    t.datetime "date"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_stalemate"
    t.integer  "created_by",   default: 1
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
