class Client < ActiveRecord::Base
    validates :industry, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :description, presence: true, length: {minimum: 50, maximum: 300}
end
