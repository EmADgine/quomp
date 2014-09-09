class Soopatroopa < ActiveRecord::Migration
  def change

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
  end
end
