class DropTables < ActiveRecord::Migration
  def change
      drop_table :basicinfos
      drop_table :clients
      drop_table :providers
      drop_table :clientdetails
      drop_table :providerdetails
  end
end
