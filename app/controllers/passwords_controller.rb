class PasswordsController < Devise::PasswordsController

    protected
    def after_resetting_password_path_for(resource)
        account_url
    end

end
