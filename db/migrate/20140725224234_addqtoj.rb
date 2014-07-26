class Addqtoj < ActiveRecord::Migration
  def change
      add_column :jobs, :question, :string, :limit => nil
  end
end
