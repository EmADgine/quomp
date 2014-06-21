class UsersController < ApplicationController
  def new
      @user = User.new
  end
  def show
      @user = User.find(params[:id])
  end

  def create
      @user=User.new(user_params_create)
      if @user.save
          flash[:success] = "Welcome to Quomp!"
          redirect_to 
      else 
          render 'new'
      end
  end
begin
  def edit
      @user = User.find(params[:id])
  end
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params_edit)
          flash[:success] = "Profile Updated"
          redirect_to @user
      else
          render 'edit'
      end
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
