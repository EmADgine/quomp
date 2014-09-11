class Addtometa < ActiveRecord::Migration
  def change
      add_column :provider_meta, :knowledge, :integer
  end
end
