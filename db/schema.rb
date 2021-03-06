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

ActiveRecord::Schema.define(version: 20140916021613) do

  create_table "badges", force: true do |t|
    t.string  "name"
    t.integer "provider_meta_id"
  end

  create_table "client_meta", force: true do |t|
    t.integer  "responsiveness"
    t.integer  "expectations"
    t.integer  "scopeofwork"
    t.integer  "payment"
    t.integer  "likeability"
    t.integer  "overall"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "discipline_skills", force: true do |t|
    t.integer  "skill_id"
    t.integer  "discipline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discipline_skills", ["discipline_id"], name: "index_discipline_skills_on_discipline_id"
  add_index "discipline_skills", ["skill_id"], name: "index_discipline_skills_on_skill_id"

  create_table "disciplines", force: true do |t|
    t.string   "name"
    t.integer  "years"
    t.text     "description"
    t.integer  "user_id"
    t.string   "portfolio_file_name"
    t.string   "portfolio_content_type"
    t.integer  "portfolio_file_size"
    t.datetime "portfolio_updated_at"
  end

  create_table "idealattributes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_idealattributes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
    t.integer  "idealattribute_id"
  end

  add_index "job_idealattributes", ["idealattribute_id"], name: "index_job_idealattributes_on_idealattribute_id"
  add_index "job_idealattributes", ["job_id"], name: "index_job_idealattributes_on_job_id"

  create_table "job_meta", force: true do |t|
    t.integer  "responsiveness"
    t.integer  "likeability"
    t.integer  "professionalism"
    t.integer  "quality"
    t.integer  "timeliness"
    t.integer  "attention"
    t.integer  "knowledge"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  create_table "job_skills", force: true do |t|
    t.integer  "job_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_skills", ["job_id"], name: "index_job_skills_on_job_id"
  add_index "job_skills", ["skill_id"], name: "index_job_skills_on_skill_id"

  create_table "job_tasks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
    t.integer  "task_id"
  end

  add_index "job_tasks", ["job_id"], name: "index_job_tasks_on_job_id"
  add_index "job_tasks", ["task_id"], name: "index_job_tasks_on_task_id"

  create_table "jobs", force: true do |t|
    t.string   "discipline"
    t.string   "task"
    t.text     "description"
    t.date     "startdate"
    t.date     "deadline"
    t.boolean  "expreq"
    t.string   "pricemethod"
    t.integer  "budget"
    t.string   "mockups_file_name"
    t.string   "mockups_content_type"
    t.integer  "mockups_file_size"
    t.datetime "mockups_updated_at"
    t.string   "question"
    t.string   "name"
    t.string   "business_description"
    t.integer  "transaction_frequency"
    t.integer  "years_req"
    t.string   "abilities"
    t.string   "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "posttime"
    t.integer  "tier"
  end

  create_table "pastjobs", force: true do |t|
    t.string  "pj_employer"
    t.string  "pj_position"
    t.date    "startdate"
    t.date    "enddate"
    t.boolean "current"
    t.string  "location"
    t.integer "user_id"
  end

  create_table "provider_meta", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "tier"
    t.decimal  "likeability",     precision: 5, scale: 2
    t.decimal  "knowledge",       precision: 5, scale: 2
    t.decimal  "quality",         precision: 5, scale: 2
    t.decimal  "professionalism", precision: 5, scale: 2
    t.decimal  "responsiveness",  precision: 5, scale: 2
    t.decimal  "timeliness",      precision: 5, scale: 2
    t.decimal  "attention",       precision: 5, scale: 2
  end

  create_table "references", force: true do |t|
    t.string  "ref_name"
    t.string  "ref_email"
    t.integer "user_id"
    t.string  "ref_company"
    t.string  "ref_phone"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "strength"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "discipline"
  end

  create_table "tasks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "discipline"
  end

  create_table "testimonial", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "provtier"
    t.integer  "client_meta_id"
  end

  create_table "user_jobs", force: true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_jobs", ["job_id"], name: "index_user_jobs_on_job_id"
  add_index "user_jobs", ["user_id"], name: "index_user_jobs_on_user_id"

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
    t.text     "description"
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
    t.string   "university"
    t.boolean  "use_desc"
    t.boolean  "anonymous"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
