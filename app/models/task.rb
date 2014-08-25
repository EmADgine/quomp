class Task < ActiveRecord::Base
    has_many :job_tasks
    scope :by_discipline, lambda {|discipline| {conditions: {discipline: disciplne}}} 
end
