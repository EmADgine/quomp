class AddToBasicinfos < ActiveRecord::Migration
  def up
      add_column :basicinfos, :name, :string
      add_column :basicinfos, :email, :string
      add_column :basicinfos, :password, :string
      add_column :basicinfos, :password_confirmation, :string
  end
end
