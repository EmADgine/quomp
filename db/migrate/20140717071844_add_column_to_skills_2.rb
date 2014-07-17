class AddColumnToSkills2 < ActiveRecord::Migration
  def change
      add_column :skills, :discipline, :string
  end
end
