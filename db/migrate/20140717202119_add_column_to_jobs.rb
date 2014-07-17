class AddColumnToJobs < ActiveRecord::Migration
    def change
        add_column :jobs, :mockups_file_name, :string
        add_column :jobs, :mockups_content_type, :string
        add_column :jobs, :mockups_file_size, :integer
        add_column :jobs, :mockups_updated_at, :datetime
    end
end
