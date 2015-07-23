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

ActiveRecord::Schema.define(version: 20150614183720) do

  create_table "courses", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "weekday",          limit: 255
    t.string   "time",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "student_group_id", limit: 4
  end

  add_index "courses", ["student_group_id"], name: "index_courses_on_student_group_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer "month_nr",   limit: 4
    t.integer "year_nr",    limit: 4
    t.boolean "paid",       limit: 1
    t.integer "student_id", limit: 4
  end

  add_index "payments", ["student_id"], name: "index_payments_on_student_id", using: :btree

  create_table "student_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "price",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "surname",          limit: 255
    t.string   "street",           limit: 255
    t.string   "city",             limit: 255
    t.string   "country",          limit: 255
    t.string   "phone_nr",         limit: 255
    t.boolean  "accepted_terms",   limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "student_group_id", limit: 4
  end

  add_index "students", ["student_group_id"], name: "index_students_on_student_group_id", using: :btree

  add_foreign_key "payments", "students"
  add_foreign_key "students", "student_groups"
end
