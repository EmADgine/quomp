class Goal < ActiveRecord::Base
   has_many :job_goals
    scope :by_discipline, lambda {|discipline| {conditions: {discipline: disciplne}}} 
end
