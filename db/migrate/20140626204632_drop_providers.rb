class DropProviders < ActiveRecord::Migration
  def up
      drop_table :providers
  end
end
