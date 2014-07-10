class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
        t.string :skillname
        t.integer :importance
        t.belongs_to :job
    end
  end
end
