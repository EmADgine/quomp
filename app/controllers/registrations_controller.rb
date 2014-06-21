class RegistrationsController < Devise::RegistrationsController
    protected
    def after_sign_up_path_for(resource)
        if resource.is_a?(User)
            edit_user_registration_path
        else
            super
        end
    end
    def after_inactive_sign_up_path_for(resource)
        if resource.is_a?(User)
            edit_user_registration_path
        else
            super
        end
    end
    end

