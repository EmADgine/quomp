class RegistrationsController < Devise::RegistrationsController
    skip_before_filter :verify_authenticity_token, :only => :create
    def sign_up(resource_name, resource)
        sign_in(:user, resource)
    end
    protected
    def after_sign_up_path_for(resource)
        if resource.is_a?(Client)
            edit_client_path(current_user.id)
        elsif resource.is_a?(Provider)
            edit_provider_path(current_user.id)
        else
            super
        end
    end
end

