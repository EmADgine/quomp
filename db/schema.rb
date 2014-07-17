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

ActiveRecord::Schema.define(version: 20140717071844) do

  create_table "discipline_skills", force: true do |t|
    t.integer  "skill_id"
    t.integer  "discipline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "discipline_skills", ["discipline_id"], name: "index_discipline_skills_on_discipline_id"
  add_index "discipline_skills", ["job_id"], name: "index_discipline_skills_on_job_id"
  add_index "discipline_skills", ["skill_id"], name: "index_discipline_skills_on_skill_id"

  create_table "disciplines", force: true do |t|
    t.string   "name"
    t.integer  "years"
    t.string   "description"
    t.integer  "user_id"
    t.string   "portfolio_file_name"
    t.string   "portfolio_content_type"
    t.integer  "portfolio_file_size"
    t.datetime "portfolio_updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string  "discipline"
    t.string  "task"
    t.string  "description"
    t.date    "startdate"
    t.date    "deadline"
    t.boolean "expreq"
    t.string  "pricemethod"
    t.integer "budget"
    t.integer "user_id"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "strength"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "discipline"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "password_digest"
    t.string   "industry"
    t.string   "city"
    t.string   "state"
    t.string   "website"
    t.string   "description"
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
    t.string   "type"
    t.string   "ptype"
    t.string   "education"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "linkedin"
    t.time     "begin"
    t.time     "end"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
