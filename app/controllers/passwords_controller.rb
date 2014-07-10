class PasswordsController < Devise::PasswordsController
=begin
    protected
    def after_resetting_password_path_for(resource)
        stored_location_for(resource)||account_url
    end
=end
end
