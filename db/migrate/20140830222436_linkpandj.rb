class Linkpandj < ActiveRecord::Migration
  def change
      create_table :user_jobs do |t|
          t.integer :user_id
          t.integer :job_id
          t.timestamps
      end
      add_index :user_jobs, :job_id
      add_index :user_jobs, :user_id
  end
end
