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

ActiveRecord::Schema.define(version: 20140909092502) do

  create_table "client", primary_key: "clientid", force: true do |t|
    t.boolean  "remainanonymous"
    t.integer  "industryid"
    t.string   "email",           limit: 250
    t.string   "pwd",             limit: 250
    t.datetime "createddate"
    t.datetime "updateddate"
    t.datetime "deleteddate"
  end

  create_table "clientmeta", primary_key: "clientmetaid", force: true do |t|
    t.integer  "clientid",                      null: false
    t.string   "key",               limit: 250, null: false
    t.string   "value",             limit: 250, null: false
    t.datetime "createddatetime"
    t.datetime "deletedatdatetime"
  end

  create_table "clientprojectweightingmeta", primary_key: "clientprojectweightingmetaid", force: true do |t|
    t.integer  "projectid",                     null: false
    t.string   "key",               limit: 250, null: false
    t.string   "value",             limit: 250, null: false
    t.datetime "createddatetime"
    t.datetime "deletedatdatetime"
  end

  create_table "clients", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discipline", primary_key: "disciplineid", force: true do |t|
    t.string "disciplinename", limit: 250, null: false
  end

  create_table "disciplineskill", primary_key: "disciplineskillid", force: true do |t|
    t.integer "disciplineid", null: false
    t.integer "skillid",      null: false
  end

  create_table "disciplinetasktype", primary_key: "disciplinetasktypeid", force: true do |t|
    t.integer "disciplineid", null: false
    t.integer "tasktypeid",   null: false
  end

  create_table "educationlevel", primary_key: "educationlevelid", force: true do |t|
    t.string "educationlevelname", limit: 250, null: false
  end

  create_table "industry", primary_key: "industryid", force: true do |t|
    t.string "industryname", limit: 250, null: false
  end

  create_table "project", primary_key: "projectid", force: true do |t|
    t.integer  "projectstateid"
    t.integer  "clientid"
    t.integer  "providerid"
    t.integer  "disciplineid"
    t.integer  "tierid"
    t.string   "projectname",           limit: 250
    t.string   "projectgoals",          limit: 250
    t.string   "projectdescription",    limit: 250
    t.string   "uploadlocation",        limit: 250
    t.string   "attributesknowledge",   limit: 250
    t.datetime "startbydatetime"
    t.datetime "deadlinedatetime"
    t.integer  "minyears"
    t.integer  "maxyears"
    t.string   "interactionfrequency",  limit: 250
    t.boolean  "filterbyindustry"
    t.string   "budgetcurrency",        limit: 3
    t.decimal  "budget",                            precision: 10, scale: 2
    t.integer  "hours"
    t.decimal  "effectivehourlyrate",               precision: 10, scale: 2
    t.datetime "advertisementdatetime"
    t.datetime "createddate"
    t.datetime "updateddate"
    t.datetime "deleteddate"
    t.integer  "qualityofwork"
    t.integer  "timeliness"
    t.integer  "responsiveness"
    t.integer  "professionalism"
    t.integer  "likeability"
    t.integer  "knowledge"
    t.integer  "attentiontodetail"
  end

  create_table "projectskillset", primary_key: "projectskillsetid", force: true do |t|
    t.integer "projectid", null: false
    t.integer "skillid",   null: false
  end

  create_table "projectstate", primary_key: "projectstateid", force: true do |t|
    t.string "projectstatename", limit: 100, null: false
  end

  create_table "projecttask", primary_key: "projecttaskid", force: true do |t|
    t.integer "projectid",  null: false
    t.integer "tasktypeid", null: false
  end

  create_table "provider", primary_key: "providerid", force: true do |t|
    t.integer  "providertypeid"
    t.integer  "educationlevelid"
    t.string   "email",             limit: 250
    t.string   "pwd",               limit: 250
    t.datetime "beginavailability"
    t.datetime "endavailability"
    t.boolean  "isavailable"
    t.datetime "createddate"
    t.datetime "updateddate"
    t.datetime "deleteddate"
  end

  create_table "providerdiscipline", primary_key: "providerdisciplineid", force: true do |t|
    t.integer "providerid"
    t.integer "disciplineid"
    t.integer "currenttierid"
    t.integer "yearsexperience"
    t.string  "providerdisciplinebio", limit: 1000
    t.string  "disciplineportfolio",   limit: 1000
  end

  create_table "providerdisciplineskills", primary_key: "providerdisciplineskillsid", force: true do |t|
    t.integer "providerdisciplineid", null: false
    t.integer "skillid",              null: false
  end

  create_table "providermeta", primary_key: "providermetaid", force: true do |t|
    t.integer  "providerid",                null: false
    t.string   "key",           limit: 250, null: false
    t.string   "value",         limit: 250, null: false
    t.datetime "createddate"
    t.datetime "deletedatdate"
  end

  create_table "providers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providertype", primary_key: "providertypeid", force: true do |t|
    t.string "providertypename", limit: 250, null: false
  end

  create_table "skill", primary_key: "skillid", force: true do |t|
    t.string "skillname", limit: 50, null: false
  end

  create_table "tasktype", primary_key: "tasktypeid", force: true do |t|
    t.string  "tasktypename", limit: 250, null: false
    t.integer "hours",                    null: false
  end

  create_table "tierpricefloor", primary_key: "tierpricefloorid", force: true do |t|
    t.integer "disciplineid",                                    null: false
    t.integer "tierid",                                          null: false
    t.string  "currency",     limit: 3,                          null: false
    t.decimal "hourlyfloor",            precision: 10, scale: 2, null: false
  end

  create_table "tiers", primary_key: "tierid", force: true do |t|
    t.string "tiername", limit: 250, null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
