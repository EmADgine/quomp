class RegistrationsController < Devise::RegistrationsController
=begin
         def update
        account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

        if account_update_params[:password].blank?
            account_update_params.delete("password")
            account_update_params.delete("password_confirmation")
        end

        @user = User.find(current_user.id)
        if @user.update_attributes(account_update_params)
            set_flash_message :notice, :updated
            sign_in @user, :bypass=> true
            redirect_to after_update_path_for(@user)
        else
            set_flash_message :failure, "update failed"
            render 'edit'
        end
    end
=end
    protected
    def after_sign_up_path_for(resource)
        if resource.is_a?(User)
            edit_user_path(current_user.id)
=begin
        if resource.is_a?(User)
            if current_user.type=="c"
                edit_client_path(current_user.id)
            elsif current_user.type=="p"
                edit_provider_path(current_user.id)
            end
=end
        else
            super
        end
    end
end

