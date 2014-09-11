class Qfix < ActiveRecord::Migration
  def change
      drop_table :provider_meta_badges
      add_column :badges, :provider_meta_id, :integer
  end
end
