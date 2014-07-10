class AddColumnToDisciplines < ActiveRecord::Migration
  def change
    add_column :disciplines, :string, :name
  end
end
