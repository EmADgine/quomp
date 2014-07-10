class UsersController < ApplicationController
    before_action :authenticate_user!,
        :only => [:destroy]
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params_edit)
            flash[:success] = "Profile Updated"
            redirect_to @user
        else
            flash[:failure] = "Profile Information Invalid"
            render 'edit'
        end
    end
    private
    def user_params_create
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
    def user_params_edit
        params.require(:user).permit(:avatar,:industry,:city,:website, :description)
    end

end
