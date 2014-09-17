class Floatfix < ActiveRecord::Migration
  def change
      remove_column :provider_meta, :attention
      add_column :provider_meta, :attention, :decimal, :precision=>5,:scale=>2
  end
end
