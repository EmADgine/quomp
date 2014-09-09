namespace :legacy do
    desc 'Run all migrations'
    #task :all => [:users,:user_jobs,:jobs,:disciplines,:discipline_skills,:job_skills,:pastjobs,:skills,:tasks,:job_tasks,:references,:idealattributes,:job_idealattributes]
    task :disciplines => :environment do
        require "#{Rails.root}/app/models/legacy/legacy"
        puts "Time: #{Time.now}"
        puts "Migrating Orders"
        begin
            LegDiscipline.find_each do |leg_disc|
                puts "#{leg_disc.id}"
            end
        rescue Exception => e
            puts "Exception: #{e}"
        end
    end
end
