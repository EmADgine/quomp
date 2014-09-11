class Jobmeta < ActiveRecord::Migration
  def change
      create_table :job_meta do |t|
            t.integer :responsiveness
            t.integer :likeability
            t.integer :professionalism
            t.integer :quality
            t.integer :timeliness
            t.integer :attention
            t.integer :knowledge
            t.belongs_to :job
            t.timestamps
        end
  end
end
