class ProvidersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update]
    def show
        @provider = Provider.find(params[:id])
    end
    def edit
        @provider = Provider.find(params[:id])
    end
    def update
        @provider = Provider.find(params[:id])
        if @provider.update_attributes(provider_params_edit)
            flash[:success] = "Profile Updated"
            redirect_to @provider
        else
            flash[:failure] = "Provider Profile Information Invalid"
            render 'edit'
        end
    end
    def provider_params_edit
        params.require(:provider).permit(:avatar,:city,:state,:website,:education,:description,:resume,:linkedin, disciplines_attributes: [:id, :name,:description,:years, :_destroy])
    end
end
