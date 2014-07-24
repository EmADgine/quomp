class Job < ActiveRecord::Base
    belongs_to :user
    has_many :job_skills
    has_many :skills, through: :job_skills
    has_attached_file :mockups
    validates_attachment_content_type :mockups, :content_type =>["application/pdf","application/vnd.ms-excel",     
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        "application/msword", 
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
        "text/plain"]
end
