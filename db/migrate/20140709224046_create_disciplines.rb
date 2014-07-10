class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
        t.string :name
        t.integer :years
        t.string :description
        t.belongs_to :user
    end
  end
end
