class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.string "name"
            t.string "email"
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
            t.timestamps
        end
    end
end
