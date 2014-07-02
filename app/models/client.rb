class Client < User
    devise :database_authenticatable, :registerable,
        :recoverable,:rememberable, :trackable, :validatable
=begin this should occur in a different form?
    validates :industry, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :description, presence: true, length: {minimum: 50, maximum: 300}
=end
end
