class Testimonial < ActiveRecord::Base
    self.table_name = "testimonial"
    belongs_to :client_meta
end
