class Skill < ActiveRecord::Base
    has_many :discipline_skills
    has_many :disciplines, through: :discipline_skills
    has_many :job_skills
    
    has_many :jobs, through: :job_skills
    scope :by_discipline, lambda {|discipline| {:conditions => {:discipline => discipline}}}
end
