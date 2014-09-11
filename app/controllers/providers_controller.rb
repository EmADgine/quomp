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
        #puts @provider.disciplines.where('name LIKE ?', 'T%')
        #@provider.disciplines.where('name LIKE ?', 'Temp%').delete_all
        respond_to do |format|
            if @provider.update_attributes(provider_params_edit)
                flash[:success] = "Profile Updated"
                format.html {
                    if @provider.provider_meta.nil?
                        @provider.provider_meta = ProviderMeta.create(user_id: current_user.id)
                    end
                    redirect_to @provider 
                }
                format.js {@provider = Provider.find(params[:id])}
            else
                flash[:failure] = "Provider Profile Information Invalid"
                format.html { render 'edit' }
                format.js
            end
        end
    end
    def provider_params_edit
        params.require(:provider).permit(:avatar,:city,:state,:website,:education,:university,:description,:resume,:linkedin, :begin,:end,disciplines_attributes: [:id, :user_id, :name,:description,:years,:_destroy,:portfolio,skill_ids: []],references_attributes: [:id, :user_id, :ref_name, :ref_email,:ref_company,:ref_phone],pastjobs_attributes: [:id, :user_id, :pj_employer,:pj_position,:startdate,:enddate,:location,:current])
    end
end
