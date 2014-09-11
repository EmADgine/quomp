class Tier < ActiveRecord::Migration
  def change
      add_column :provider_meta, :tier, :integer
      add_column :jobs, :tier, :integer
  end
end
