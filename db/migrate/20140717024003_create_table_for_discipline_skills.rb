class CreateTableForDisciplineSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
        t.string :name
        t.integer :strength
    end
  end
end
