class Createjobskills < ActiveRecord::Migration
    def change
        drop_table :job_skills
        create_table :job_skills do |t|
            t.belongs_to :job
            t.belongs_to :skill
            t.timestamps
        end
        add_index :job_skills, :job_id
        add_index :job_skills, :skill_id

    end
end
