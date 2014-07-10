class Provider < User
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    validates :ptype, inclusion: ["freelancer", "agency"]
    has_attached_file :resume
    validates_attachment_content_type :resume, :content_type =>["application/pdf","application/vnd.ms-excel",     
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        "application/msword", 
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
        "text/plain"]
   
end
