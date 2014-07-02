class Provider < User
    validates :ptype, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :education, presence: true
    validates :biography, presence:true, length: {minimum: 50, maximum: 300}
    validates_format_of :linkedin, :with => URI::regexp(%w(http https))
    validates :resume, presence: true
    has_many :disciplines 
end
