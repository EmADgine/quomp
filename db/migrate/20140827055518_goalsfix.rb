class Goalsfix < ActiveRecord::Migration
  def change
      drop_table :goals
      drop_table :job_goals
      add_column :jobs, :goal, :string
  end
end
