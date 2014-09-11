class Addidmeta < ActiveRecord::Migration
  def change
      add_column :client_meta, :user_id, :integer
  end
end
