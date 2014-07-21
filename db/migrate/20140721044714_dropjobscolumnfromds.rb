class Dropjobscolumnfromds < ActiveRecord::Migration
  def change
      remove_column :discipline_skills, :job_id
  end
end
