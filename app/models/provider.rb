class Provider < User
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
=begin this should occur in a different form?
    validates :ptype, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :education, presence: true
    validates :biography, presence:true, length: {minimum: 50, maximum: 300}
    validates_format_of :linkedin, :with => URI::regexp(%w(http https))
    validates :resume, presence: true
=end
    validates :ptype, presence: true
    has_many :disciplines 
end
