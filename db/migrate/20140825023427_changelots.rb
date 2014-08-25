class Changelots < ActiveRecord::Migration
    def change
        create_table :tasks do |t|
            t.timestamps
            t.string :name
            t.string :discipline
        end 
        create_table :goals do |t|
            t.timestamps
            t.string :name
            t.string :discipline
        end

        add_column :jobs, :abilities, :string
        
        create_table :idealattributes do |t|
            t.integer :importance
            t.string :name
            t.timestamps
        end
                
        create_table :job_tasks do |t|
            t.timestamps
            t.belongs_to :job
            t.belongs_to :task
        end
        add_index :job_tasks, :job_id
        add_index :job_tasks, :task_id

        create_table :job_goals do |t|
            t.timestamps
            t.belongs_to :job
            t.belongs_to :goal
        end
        add_index :job_goals, :job_id
        add_index :job_goals, :goal_id

        create_table :job_idealattributes do |t|
            t.timestamps
            t.belongs_to :job
            t.belongs_to :idealattribute
        end
        add_index :job_idealattributes, :job_id
        add_index :job_idealattributes, :idealattribute_id

        add_column :pastjobs, :location, :string
        add_column :pastjobs, :user_id, :integer
        add_column :references, :user_id, :integer
        add_column :references, :ref_company, :string
        add_column :references, :ref_phone,:string
        drop_table :user_pastjobs
        drop_table :user_references

    end
end
