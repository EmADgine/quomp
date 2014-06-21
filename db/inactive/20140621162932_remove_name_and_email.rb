class RemoveNameAndEmail < ActiveRecord::Migration
  def self.up
      remove_column :users, :email
      remove_column :users, :name
      remove_column :providers, :email
      remove_column :providers, :name
  end
end
