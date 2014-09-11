class Badges < ActiveRecord::Migration
    def change
        create_table :badges do |t|
            t.string :name
        end
        create_table :provider_meta_badges do |t|
            t.integer :provider_meta_id
            t.integer :badge_id
        end
        add_index :provider_meta_badges, :provider_meta_id
        add_index :provider_meta_badges, :badge_id
    end
end
