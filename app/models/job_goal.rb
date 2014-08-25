class JobGoal < ActiveRecord::Base
    belongs_to :job
    belongs_to :goal
end
