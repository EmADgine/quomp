class DisciplineSkill < ActiveRecord::Base
    belongs_to :discipline
    belongs_to :skill
end
