class RegistrationsController < Devise::RegistrationsController
    skip_before_filter :verify_authenticity_token, :only => [:create]
    def update
        # For Rails 4
        account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
        # required for settings form to submit when password is left blank
        if account_update_params[:password].blank?
            account_update_params.delete("password")
            account_update_params.delete("password_confirmation")
        end

        if update_resource(resource, account_update_params)
            set_flash_message :notice, :updated
            # Sign in the user bypassing validation in case their password changed
            sign_in resource, :bypass => true
            redirect_to after_update_path_for(@user)
        else
            render "edit"
        end
    end
    def sign_up(resource_name, resource)
        sign_in(:user, resource)
    end
    protected
    def after_sign_up_path_for(resource)
        if resource.is_a? Client
            edit_client_path(current_user.id)
        elsif resource.is_a? Provider
            edit_provider_path(current_user.id)
        else
            super
        end
    end
    def after_update_path_for(resource)
=begin
        if resource.is_a? User
            stored_location_for(resource)||account_url
        else
            super
        end
=end
        account_url
    end
end

