class Providermeta < ActiveRecord::Migration
    def change
        create_table :provider_meta do |t|
            t.integer :responsiveness
            t.integer :likeability
            t.integer :professionalism
            t.integer :quality
            t.integer :timeliness
            t.integer :attention
            t.belongs_to :provider
            t.timestamps
        end
    end
end
