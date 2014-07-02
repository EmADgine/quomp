class Addptousers < ActiveRecord::Migration
  def change
      add_column :users, :ptype, :string
      add_column :users, :education, :string
      add_attachment :users, :resume
  end
end
