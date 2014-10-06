module JobsHelper
    def get_providers(job)
        providers=[]
        puts "expreq #{job.expreq}"
        check=0
        Provider.find_each do |provider|
            puts job.abilities
            puts provider.disciplines.pluck("name")
            if provider.disciplines.pluck("name").include?(job.discipline) and provider.provider_meta.tier==job.tier 
                if !job.expreq||provider.disciplines.where(:name=>job.discipline).first.years >= job.years_req
                    providers<<provider
                    check+=1
                end
            end
        end
        if check<4
            return [nil,nil,nil,nil]
        end
        providers.sort_by { |prov| weightfunction(prov,job)}
        chosen=[providers[-1],providers[-2],providers[-3],providers[-4]].shuffle
        order=(1..4).to_a.sort_by { |i| weightfunction(chosen[i-1],job) }
        order= order.reverse
        [chosen,order]
    end
    def weightfunction(provider,job)
        totalratio=0
        unless job.skills.empty?
            matching_skills=0
            provider.disciplines.where(:name=>job.discipline).first.skills.each do |skill|
                if job.skills.pluck("name").include? skill.name
                    matching_skills+=1
                end
            end
            totalratio=matching_skills/job.skills.size.to_f
        else
            totalratio=1.0
        end
        skillweighting=0.5*(1+totalratio)
        p skillweighting
        attributeweighting=0
        nj=0
        unless provider.jobs.empty?
            provider.jobs.each do |pj|
                if pj.id!=job.id and pj.tier==job.tier and pj.discipline== job.discipline
                    if get_joboverall(pj)==-1
                        return -100
                    attributeweighting+=get_joboverall(pj)
                    nj+=1
                end
            end
        end
        attributeweighting=attributeweighting/nj.to_f

        return attributeweighting*skillweighting
    end
    def get_idealattributes
        ["Timeliness","Responsiveness","Knowledge","Quality of Work","Professionalism","Likeability","Attention to Detail"]
    end 
end
