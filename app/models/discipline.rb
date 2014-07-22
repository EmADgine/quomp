class Discipline < ActiveRecord::Base
    belongs_to :user
    has_attached_file :portfolio
    
    has_many :discipline_skills
    has_many :skills, through: :discipline_skills
end
