class Provider < User
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    validates :ptype, :inclusion=>{in: ["freelancer", "agency"],message: "Please specify Provider Type"}
    has_attached_file :resume
    validates_attachment_content_type :resume, :content_type =>["application/pdf","application/vnd.ms-excel",     
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        "application/msword", 
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
        "text/plain"]
        
        has_many :disciplines, dependent: :destroy,class_name: "Discipline",foreign_key: "user_id"
        has_many :pastjobs, dependent: :destroy, class_name: "Pastjob",foreign_key:"user_id"
        has_many :references, dependent: :destroy, class_name: "Reference",foreign_key:"user_id"
        accepts_nested_attributes_for :pastjobs, allow_destroy: true
        accepts_nested_attributes_for :references, allow_destroy: true

        
        accepts_nested_attributes_for :disciplines, allow_destroy: true, :reject_if => proc {|a| a['portfolio']=="/portfolios/original/missing.png"&&a['name'].split()[0]=="Temp"}

    
end
