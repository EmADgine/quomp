class AddColumnToSkills < ActiveRecord::Migration
  def change
      add_column(:skills, :created_at, :datetime)
      add_column(:skills, :updated_at, :datetime)
  end
end
