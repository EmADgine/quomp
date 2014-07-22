class LengthenDescriptions < ActiveRecord::Migration
    def up
        change_column :disciplines, :description, :text
        change_column :jobs, :description, :text
        change_column :users, :description, :text
    end
    def down
        change_column :disciplines, :description, :string
        change_column :jobs, :description, :string
        change_column :users, :description, :string
    end
end
