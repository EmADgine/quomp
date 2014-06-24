class AddEmailAndNameToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :email, :string
    add_column :providers, :name, :string
  end
end
