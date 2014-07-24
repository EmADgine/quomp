class Removelimits < ActiveRecord::Migration
  def change
        change_column :disciplines, :description, :text, :limit=> nil
        change_column :jobs, :description, :text, :limit=>nil
        change_column :users, :description, :text,:limit=>nil
  end
end
