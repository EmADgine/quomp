class Addlinkedintoproviders < ActiveRecord::Migration
  def change
      add_column :users, :linkedin, :string
  end
end
