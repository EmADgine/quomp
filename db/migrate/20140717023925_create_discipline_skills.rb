class CreateDisciplineSkills < ActiveRecord::Migration
    def change
        create_table :discipline_skills do |t|
            t.belongs_to :skill
            t.belongs_to :discipline
            t.timestamps
        end
        add_index :discipline_skills, :discipline_id
        add_index :discipline_skills, :skill_id
    end
end
