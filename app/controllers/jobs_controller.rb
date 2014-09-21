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
        @job=Job.new(job_params)
        @job.job_meta = JobMeta.create
        @user_jobs=@parentclient.user_jobs.create(job: @job)
        respond_to do |format|
            format.html {

                if @job.save
                    redirect_to select_provider_client_job_path(current_user,@job), {method: "POST"}
                else
                    flash[:failure]
                    render 'new'
                end
            }
            format.js {
                @job.tasks=[]
                unless params[:job][:task_ids].nil?||params[:job][:task_ids].empty?
                    params[:job][:task_ids][0].split(",").each do |t_id|
                        @job.tasks << Task.find(t_id.to_i)
                    end
                end
                headers["Content-Type"] = "text/javascript; charset=utf-8"
            }
        end
    end
    def select_provider
        @parentclient=Client.find(current_user.id)
        @job= @parentclient.jobs.order("created_at").last
        @providerlist=view_context.get_providers(@job)
        @providerlist.each do |prov|
            if prov.nil?
                flash[:notice]= "We couldn't find any providers that matched your specifications.The most likely reason for this is that your required \"years of experience\" is to high or that your discipline is not set."
                redirect_to action: :new
                break
            end
        end
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
        params.require(:job,).permit({ :user_ids => [] },:discipline,:description,:startdate,:deadline,:expreq,:pricemethod,:budget,:question,:mockups,:years_req,:goal,:name,:abilities,:transaction_frequency,:posttime,:tier,idealattribute_ids:[],skill_ids:[],task_ids:[],user_ids:[])
    end
    def job_params2
        params.require(:job,).permit({ :user_ids => [] },:discipline,:description,:startdate,:deadline,:expreq,:pricemethod,:budget,:question,:mockups,:years_req,:goal,:name,:abilities,:transaction_frequency,:posttime,:tier,idealattribute_ids:[],skill_ids:[],user_ids:[])
    end

    def user_job_params
        params.require(:user_job)
    end
    def select_provider_params
        params.require(:job).permit(:provider)
    end
end
