class JobsController < ApplicationController
    before_action :authenticate_user!
    before_filter :find_user
    helper_method :get_idealattributes
    include JobsHelper
    def new
        @parentclient=Client.find(current_user.id)
        @job=Job.new
    end
    def create
        @parentclient=Client.find(current_user.id)
        @job= Job.new(job_params)
        @job.job_meta = JobMeta.create
        @user_jobs=@parentclient.user_jobs.create(job: @job)
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
        @parentclient=Client.find(current_user.id)
        @job= @parentclient.jobs.order("created_at").last
        @providerlist=view_context.get_providers(@job)
        puts @providerlist
    end
    def save_provider
        @job=@user.jobs.order("created_at").last
        puts "in save"
        Provider.find(params["prov_id"]).user_jobs.create(job: @job)
        puts Provider.find(params["prov_id"])
        puts Provider.find(params["prov_id"]).user_jobs.last.job_id
        respond_to do |format|
            format.html {
                redirect_to congratulations_path
            }
        end
    end
    def find_user
        @user=current_user
    end
    private
    def job_params
        puts "current: "+ current_user.id.to_s
        params.require(:job,).permit({ :user_ids => [] },:discipline,:description,:task,:startdate,:deadline,:expreq,:pricemethod,:budget,:question,:mockups,:years_req,:goal,:name,:abilities,:transaction_frequency,:posttime,:tier,idealattribute_ids:[],skill_ids:[],task_ids:[],user_ids:[])
    end
    def user_job_params
        params.require(:user_job)
    end
    def select_provider_params
        params.require(:job).permit(:provider)
    end
end
