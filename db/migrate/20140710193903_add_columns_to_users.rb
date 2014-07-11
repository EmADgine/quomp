class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :begin, :time
    add_column :users, :end, :time
  end
end
