class Addyearstojobs < ActiveRecord::Migration
  def change
      add_column :jobs, :years_req, :integer
  end
end
