class Addanonymous < ActiveRecord::Migration
  def change
      add_column :users, :anonymous, :boolean
  end
end
