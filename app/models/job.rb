class Job < ActiveRecord::Base
    belongs_to :user
    has_many :skills, dependent: :destroy
end
