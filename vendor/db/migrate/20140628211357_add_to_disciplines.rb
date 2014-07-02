class AddToDisciplines < ActiveRecord::Migration
  def change
      add_column :disciplines, :years, :integer
      add_column :disciplines, :description, :string
  end
end
