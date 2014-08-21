class AddColumnToUsers2 < ActiveRecord::Migration
  def change
      add_column :users, :use_desc, :boolean
  end
end
