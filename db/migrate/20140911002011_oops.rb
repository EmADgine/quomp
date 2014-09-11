class Oops < ActiveRecord::Migration
  def change
      remove_column :provider_meta, :provider_id
      add_column :provider_meta,:user_id, :integer
  end
end
