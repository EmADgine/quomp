class AddReferencesAndPastJobs < ActiveRecord::Migration
    def change
        create_table :references do |t|
            t.string :ref_name
            t.string :ref_email
        end
        create_table :pastjobs do |t|
            t.string :pj_employer
            t.string :pj_position
            t.date :startdate
            t.date :enddate
            t.boolean :current
        end
        create_table :user_references do |t|
            t.belongs_to :user
            t.belongs_to :reference
            t.timestamps
        end
        create_table :user_pastjobs do |t|
            t.belongs_to :user
            t.belongs_to :pastjob
            t.timestamps
        end
    end
end

