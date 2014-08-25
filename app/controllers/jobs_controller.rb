class JobsController < ApplicationController
    before_action :authenticate_user!
    before_filter :find_user
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
                format.html { redirect_to current_user }
                format.js {}
            else
                format.html { render 'new' }
                format.js {}
            end
        end
    end
    def find_user
        @user=current_user
    end
    private
    def job_params
        params.require(:job).permit(:discipline,:description,:task,:startdate,:deadline,:expreq,:pricemethod,:budget,:question,:mockups,:years_req,skill_ids:[],task_ids:[],goal_ids:[])
    end
end
