class Job < ActiveRecord::Base
    belongs_to :user
    has_many :job_skills
    has_many :skills, through: :job_skills
end
