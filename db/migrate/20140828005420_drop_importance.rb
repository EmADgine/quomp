class DropImportance < ActiveRecord::Migration
    def change
        remove_column :idealattributes, :importance
    end
end
