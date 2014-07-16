class Discipline < ActiveRecord::Base
    belongs_to :user
    validates :years, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 300}
    has_attached_file :portfolio
end
