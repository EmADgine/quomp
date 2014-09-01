class JobsController < ApplicationController
    before_action :authenticate_user!
    before_filter :find_user
    helper_method :get_idealattributes
    include JobsHelper
    def new
        @job= Job.new(:user_id=>current_user.id)
        @job.budget="$"
        @parentclient = Client.find(current_user.id)
    end
    def create
        @job= Job.new(job_params)
        
        Rails.logger.debug("Hello!")
        respond_to do |format|
            if @job.save
                Rails.logger.debug("saved");
                flash[:success]
                format.html { redirect_to select_provider_client_job_path(current_user,@job), {method: "POST"}}
                format.js {}
            else
                format.html { render 'new' }
                format.js {}
            end
        end
    end
    def select_provider
        @job=@user.jobs.order("created_at").last
        @providerlist=view_context.get_providers(@job)
    end
    def save_provider
        @job=@user.jobs.order("created_at").last
        if @job.update_attributes(select_provider_params)
            flash[:success]
            redirect_to current_user
        else
            redirect_to action: "select_provider"
        end
    end
    def find_user
        @user=current_user
    end
    private
    def job_params
        params.require(:job).permit(:discipline,:description,:task,:startdate,:deadline,:expreq,:pricemethod,:budget,:question,:mockups,:years_req,:goal,skill_ids:[],task_ids:[])
    end
    def select_provider_params
        params.require(:job).permit(:provider)
    end
end
