class Skill < ActiveRecord::Base
    has_many :discipline_skills
    has_many :disciplines, through: :discipline_skills
end
