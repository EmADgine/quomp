class AddIndexToDisciplineSkills < ActiveRecord::Migration
    def change
        add_column :discipline_skills, :job_id, :integer
        add_index :discipline_skills, :job_id
    end
end
