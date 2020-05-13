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

ActiveRecord::Schema.define(version: 20200513081055) do

  create_table "carriers", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.integer  "age"
    t.boolean  "has_driver_licence_a"
    t.boolean  "has_driver_licence_b"
    t.boolean  "has_driver_licence_c"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "altitude"
  end

  create_table "transporters", force: :cascade do |t|
    t.string "name"
    t.string "siret"
    t.string "postal_codes"
    t.string "carriers"
  end

end
