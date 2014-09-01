class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.

    protect_from_forgery with: :exception
    before_action :configure_devise_permitted_parameters, if: :devise_controller? 
    protected
    helper_method :account_url
    def account_url
        return new_user_session_url unless user_signed_in?
        case current_user.class.name
        when 'Client'
            current_user
        when 'Provider'
            current_user
        end if user_signed_in?
    end

    %w(Client Provider).each do |k|
        define_method "current_#{k.underscore}" do
            current_user if current_user.is_a?(k.constantize)
        end
        define_method "authenticate_#{k.underscore}!" do |opts={}|
            send("current_#{k.underscore}") || not_authorized
        end
    end
    def configure_devise_permitted_parameters
        #registration_params = [:name,:email,:password,:password_confirmation]
        #if params[:action] == 'create'
        #    devise_parameter_sanitizer.for(:sign_up) {
        #        |u| u.permit(registration_params)
        #    }
        #end

        devise_parameter_sanitizer.for(:sign_up) do |u|
            u.permit(:name,:email,:password,:password_confirmation,:ptype)
        end
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username,:email)}
        devise_parameter_sanitizer.for(:account_update) do |u|
            u.permit(:name,:email,:password, :password_confirmation,:current_password)
        end
    end
end
