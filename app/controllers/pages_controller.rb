class PagesController < ApplicationController
    def home
    end
    def select_splash
        @client = current_user
        @job = @client.jobs.order(:created_at).last
        @provider = nil
        UserJob.where(job_id: @job.id).order('created_at').pluck('user_id').each do |id|
            if Provider.find_by(id: id) != nil
                @provider = Provider.find_by(id: id)
            end
        end
    end
end
