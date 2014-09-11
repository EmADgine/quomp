class Client < User
    devise :database_authenticatable, :registerable,
        :recoverable,:rememberable, :trackable, :validatable
    
    has_one :client_meta, dependent: :destroy, class_name: "ClientMeta",foreign_key: "user_id"
end
