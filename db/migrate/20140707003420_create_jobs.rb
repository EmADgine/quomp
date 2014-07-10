class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
        t.string :discipline
        t.string :task
        t.string :description
        t.date :startdate
        t.date :deadline
        t.boolean :expreq
        t.string :pricemethod
        t.integer :budget
        t.belongs_to :user
    end
  end
end
