class Skill < ActiveRecord::Base
    has_many :discipline_skills
    has_many :disciplines, through: :discipline_skills
    scope :by_discipline, lambda {|discipline| {:conditions => {:discipline => discipline}}}
end
