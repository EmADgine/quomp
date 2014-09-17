class Floats < ActiveRecord::Migration
    def change
        remove_column :provider_meta, :likeability
        remove_column :provider_meta, :knowledge
        remove_column :provider_meta, :quality
        remove_column :provider_meta, :professionalism
        remove_column :provider_meta, :responsiveness
        remove_column :provider_meta, :timeliness

        add_column :provider_meta, :likeability, :decimal, :precision=>5,:scale=>2
        add_column :provider_meta, :knowledge, :decimal, :precision=>5, :scale=>2
        add_column :provider_meta, :quality, :decimal, :precision=>5, :scale=>2
        add_column :provider_meta, :professionalism, :decimal, :precision=>5, :scale=>2
        add_column :provider_meta, :responsiveness, :decimal, :precision=>5, :scale=>2
        add_column :provider_meta, :timeliness, :decimal, :precision=>5, :scale=>2


    end
end
