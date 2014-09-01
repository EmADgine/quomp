class Discipline < ActiveRecord::Base
    has_attached_file :portfolio
    validates_attachment_content_type :portfolio, :content_type =>["application/pdf","application/vnd.ms-excel",     
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        "application/msword", 
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
        "text/plain"]
    alias_attribute :provider_id, :user_id
    has_many :discipline_skills
    has_many :skills, through: :discipline_skills

end
