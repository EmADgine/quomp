class AddToUser < ActiveRecord::Migration
  def change
        add_column :users, :type, :string
        add_index :users, :email, unique:true
        add_index :users, :reset_password_token, unique: true
  end
end
