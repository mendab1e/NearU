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

ActiveRecord::Schema.define(version: 20140810001802) do

  create_table "boards", force: true do |t|
    t.string   "text"
    t.text     "full_text"
    t.text     "url"
    t.date     "payed_until"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["lat", "long"], name: "index_boards_on_lat_and_long"

  create_table "dictionaries", force: true do |t|
    t.string   "bigram"
    t.integer  "count",      default: 0
    t.integer  "weight",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dictionaries", ["bigram"], name: "index_dictionaries_on_bigram"

  create_table "tweets", force: true do |t|
    t.float    "long"
    t.float    "lat"
    t.string   "user_screen_name"
    t.string   "text"
    t.datetime "tweet_created_at"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["long", "lat", "tweet_created_at"], name: "index_tweets_on_long_and_lat_and_tweet_created_at"

end
