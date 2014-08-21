class ProvidersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update]
    skip_before_action :verify_authenticity_token
    def show
        @provider = Provider.find(params[:id])
    end
    def edit
        @provider = Provider.find(params[:id])
    end
    def update
        @provider = Provider.find(params[:id])
        respond_to do |format|
            if @provider.update_attributes(provider_params_edit)
                flash[:success] = "Profile Updated"
                format.html { redirect_to @provider }
                format.js {@provider = Provider.find(params[:id])}
            else
                flash[:failure] = "Provider Profile Information Invalid"
                format.html { render 'edit' }
                format.js
            end
        end
    end
    def provider_params_edit
        params.require(:provider).permit(:avatar,:city,:state,:website,:education,:university,:description,:resume,:linkedin, :begin,:end,disciplines_attributes: [:id, :user_id, :name,:description,:years,:_destroy,:portfolio,skill_ids: []])
    end
end
