require 'valid_email'

class Provider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    before_save {self.email = email.downcase}
    LOGO_TYPES = ['image/jpeg', 'image/png', 'image/gif']
    has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => LOGO_TYPES
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, :email => {:ban_disposable_email => true, :message => I18n.t('validations.errors.models.user.invalid_email')}, uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 6} 

end
