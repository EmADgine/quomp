class Discipline < ActiveRecord::Base
    belongs_to :provider
    validates :years, presence: true
    validates :description, presence: true, length: {minimum: 50, maximum: 300}
end
