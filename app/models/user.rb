class User < ActiveRecord::Base

    before_save {self.email = email.downcase}

    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, :email => {:ban_disposable_email => true, :message => I18n.t('validations.errors.models.user.invalid_email')}, uniqueness: { case_sensitive: false }

    validates :password, presence: true, :if=>:password_validation_required?

    LOGO_TYPES = ['image/jpeg', 'image/png', 'image/gif']
    has_attached_file :avatar, :styles => {:medium => "300x300>",:small=>"200x200>", :icon => "100x100>" }, :default_url => '/assets/missing_:style.png'
    validates_attachment_content_type :avatar, :content_type => LOGO_TYPES
    def password_validation_required?
        !@password.blank?
    end


    has_many :disciplines, dependent: :destroy
    has_many :jobs, dependent: :destroy

    accepts_nested_attributes_for :disciplines, allow_destroy: true, :reject_if => proc {|a| a['portfolio']=="/portfolios/original/missing.png"}
end
