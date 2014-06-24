class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :industry, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :website, :string
    add_column :users, :description, :string
  end
end
