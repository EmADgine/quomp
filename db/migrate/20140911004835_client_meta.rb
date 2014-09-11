class ClientMeta < ActiveRecord::Migration
    def change
        create_table :client_meta do |t|
            t.integer :responsiveness
            t.integer :expectations
            t.integer :scopeofwork
            t.integer :payment
            t.integer :likeability
            t.integer :overall
            t.timestamps
        end
        create_table :testimonial do |t|
            t.text :description
            t.timestamps
            t.integer :provtier
        end
        create_table :client_meta_testimonials do |t|
            t.belongs_to :client_meta
            t.belongs_to :testimonial
        end
        add_index :client_meta_testimonials, :client_meta_id
        add_index :client_meta_testimonials, :testimonial_id
    end
end
