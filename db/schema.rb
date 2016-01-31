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

ActiveRecord::Schema.define(version: 20160130225104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "masteries", force: :cascade do |t|
    t.integer "riot_id",           limit: 8
    t.string  "name"
    t.string  "mastery_tree_name"
    t.text    "descriptions",                default: [], array: true
    t.string  "prereq"
    t.integer "ranks"
    t.string  "image_full"
    t.string  "image_group"
    t.string  "image_sprite"
    t.integer "image_h"
    t.integer "image_w"
    t.integer "image_x"
    t.integer "image_y"
  end

  create_table "summoners", force: :cascade do |t|
    t.string   "name"
    t.integer  "profile_icon_id"
    t.integer  "revision_date"
    t.integer  "summoner_level"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
