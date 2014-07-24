class JobsController < ApplicationController
    before_action :authenticate_user!
    before_filter :find_user
    def new
        @job= Job.new(:user_id=>current_user.id)
        @job.budget="$"
    end
    def create
        @job= Job.new(job_params)
        if @job.save
            flash[:success]
            redirect_to current_user
        else
            render 'new'
        end
    end
    def find_user
        @user=current_user
    end
    private
    def job_params
        params.require(:job).permit(:discipline,:description,:task,:startdate,:deadline,:expreq,:pricemethod,:budget,:mockups)
    end
end
