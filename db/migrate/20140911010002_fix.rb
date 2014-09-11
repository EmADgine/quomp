class Fix < ActiveRecord::Migration
  def change
      add_column :job_meta, :score, :integer
      add_column :testimonial, :client_meta_id, :integer
      drop_table :client_meta_testimonials
  end
end
