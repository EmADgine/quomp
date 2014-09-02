class Addposttime < ActiveRecord::Migration
  def change
      add_column :jobs, :posttime, :datetime
  end
end
