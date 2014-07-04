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
        case params["ptype"]
        when "freelancer"
            @provider.ptype="freelancer"
        when "agency"
            @provider.ptype="agency"
        end
        if @provider.update_attributes(provider_params_edit)
            flash[:success] = "Profile Updated"
            redirect_to @provider
        else
            flash[:failure] = "Profile Information Invalid"
            render 'edit'
        end
    end
    def provider_params_edit
        #params.require(:client).permit(:avatar,:industry,:city,:website, :description)
    end
end
