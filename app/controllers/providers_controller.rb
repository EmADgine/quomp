class ProvidersController < ApplicationController
    def new
        @provider = Provider.new
    end
    def show
        @provider = Provider.find(params[:id])
    end
    def create
        @provider=Provider.new(prov_params)
        if @provider.save
            flash[:success] = "Welcome to Quomp!"
            redirect_to @provider
        else 
            render 'new'
        end
    end

    def edit
        @provider = Provider.find(params[:id])
    end
    def update
        @provider = Provider.find(params[:id])
        if @provider.update_attributes(user_params)
            flash[:success] = "Profile Updated"
            redirect_to @provider
        else
            render 'edit'
        end
    end
    private
    def prov_params
        params.require(:provider).permit(:name,:email,:password,:password_confirmation,:avatar,:industry,:city,:website, :description)
    end
end
