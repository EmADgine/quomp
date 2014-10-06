module ApplicationHelper

    def maketime(s)
        if s[0]=='0'
            s=s[1..-1]
        end
        s=s.split(':')
        unless s[0].to_i / 12 == 0
            s[0]=(s[0].to_i%12).to_s
            if s[0]=='0'
                s[0]='12'
            end
            return s.join(':')+'PM'
        end
        s.join(':')+'AM'
    end
    def link_to_remove_fields(name, f)
        f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
    end

    def add_fields_arguments(f, association,current_disciplines,name,exists)
        unless exists
            new_object = f.object.send(association).klass.new
        else
            new_object = f.object.send(association).klass.find(current_disciplines.where('name LIKE?',name).first.id)
        end
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render partial: association.to_s.singularize + "_fields", :locals =>{:f=> builder, :nom=> name}
        end
        {fields: fields.gsub("\n",""), id: id}
    end
    def link_to_add_fields1(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render(association.to_s.singularize + "_fields", f: builder)
        end
        link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end

    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end

    def full_title(pt)
        base = "Quomp"
        if pt.empty?
            base
        else
            "#{base} | #{pt}"
        end
    end

    def dry(array)
        result=[]
        array.each do |item|
            if !result.include? item
                result << item
            end
        end
        result
    end
    def translation_error_filter(array)
        result=[]
        array.each do |item|
            if !item.include? 'translation'
                result << item
            end
        end
        result
    end
    def linkerate(link)
        if link==nil
            link=''
        end
        return link.sub('http://','').sub('www.','').downcase

    end

    def us_states
        [
            ['AK', 'AK'],
            ['AL', 'AL'],
            ['AR', 'AR'],
            ['AZ', 'AZ'],
            ['CA', 'CA'],
            ['CO', 'CO'],
            ['CT', 'CT'],
            ['DC', 'DC'],
            ['DE', 'DE'],
            ['FL', 'FL'],
            ['GA', 'GA'],
            ['HI', 'HI'],
            ['IA', 'IA'],
            ['ID', 'ID'],
            ['IL', 'IL'],
            ['IN', 'IN'],
            ['KS', 'KS'],
            ['KY', 'KY'],
            ['LA', 'LA'],
            ['MA', 'MA'],
            ['MD', 'MD'],
            ['ME', 'ME'],
            ['MI', 'MI'],
            ['MN', 'MN'],
            ['MO', 'MO'],
            ['MS', 'MS'],
            ['MT', 'MT'],
            ['NC', 'NC'],
            ['ND', 'ND'],
            ['NE', 'NE'],
            ['NH', 'NH'],
            ['NJ', 'NJ'],
            ['NM', 'NM'],
            ['NV', 'NV'],
            ['NY', 'NY'],
            ['OH', 'OH'],
            ['OK', 'OK'],
            ['OR', 'OR'],
            ['PA', 'PA'],
            ['RI', 'RI'],
            ['SC', 'SC'],
            ['SD', 'SD'],
            ['TN', 'TN'],
            ['TX', 'TX'],
            ['UT', 'UT'],
            ['VA', 'VA'],
            ['VT', 'VT'],
            ['WA', 'WA'],
            ['WI', 'WI'],
            ['WV', 'WV'],
            ['WY', 'WY']
        ]
    end
    def get_industries
        ['Basic Materials','Chemicals','Automotive','Food & Beverage','Personal & Household Goods','Media & Entertainment','Retail','Travel & Leisure','Banks','Financial Services','Insurance','Health Care','Construction & Materials','Industrial Goods & Services', 'Oil & Gas','Technology','Telecommunications','Utilities','Government','Other']
    end
    def get_educations
        ['PhD','Master\'s Degree','Bachelor\'s Degree', 'High School Diploma']
    end
    def get_disciplines
        {
            ms: "Marketing Strategy",
            em: "Email Marketing",
            ps: "Paid Search",
            seo: "SEO",
            sm: "Social Media"
        }
    end
    def get_goals_by_discipline(discipline)
        map={"Email Marketing"=>["Increase your email list size or growth rate","Increase click-to-open or click-through-rate (CTR)","Decrease Unsubscribe rate"],"Marketing Strategy"=>["Establish a brand / increase awareness of your product or service","Improve distribution of your product or service","Launch your digital marketing presence"],"Paid Search"=>["Increase overall return on investment (ROI) on return on ad spend (ROAS)","Increase click rate through rate (CTR) relative to my competitors","Increase conversion rate (CVR)"],"SEO"=>["Increase month-over-month unique visitors to my site from organic search","Increase Leads from my website","Increase number of pages per visitor"],"Social Media"=>["Increase my follower base","Increase brand mentions","Increase frequency of my posts"]}
        map[discipline]
    end
    def get_discipline_key(disc)
        map={"Email Marketing"=>"EM","Marketing Strategy"=> "MS","Paid Search"=>"PS","Social Media"=>"SM","SEO"=>"SEO"}
        map[disc]
    end
    def file_by_ptype(ptype)
        map={"agency"=>"Overview Doc","freelancer"=>"Resumé"}
        map[ptype]
    end
    def get_idealattributes
        ["Timeliness","Responsiveness","Knowledge","Quality of Work","Professionalism","Likeability","Attention to Detail"]
    end
    def clamp(description)
        unless description.length>180
            description
        else 
            words=description.split();
            result=''
            until result.length > 180 do
                result+=words.shift+' ';
            end
            return result
        end
    end
    def get_badges
        def func x
            ": Completed 5 jobs that scored greater than 9.5 out of 10 on "+x
        end
        {"rainmaker"=>["Rainmaker: Highest Project Value","umbrella"],"workhorse"=>["Work Horse: Most Projects Completed","coffee"],"highfligher"=>["High Flyer: Biggest Rankings Jump","space-shuttle"],"milestonejuggernaut"=>["Milestone Juggernaut"+func('timeliness'),"clock-o"],"firstresponder"=>["First Responder"+func('responsiveness'),"bolt"],"encyclopedia"=>['Encyclopedia'+func('knowledge'),'book'],"killerquality"=>["Killer Quality"+func('quality of work'),'bullseye'],"trueprofessional"=>["True Professional"+func('professionalism'),'briefcase'],"bestbuddy"=>["Best Buddy"+func('likeability'),'beer'],"therock"=>["The Rock: Maintained a high average and didn't deviate",'bank']}
    end
    def get_badge(name)
        get_badges[name]
    end
    def get_hours(disc,tsk)
        {"Email Marketing"=>{"Email Design"=>4,"Email Coding"=>5,"Email Deliverability"=>1},"SEO"=>{"On Page Audit"=> 2,"On Page Optimization"=>5,"Off Page Optimization"=>5},"Paid Search"=>{"Campaign Research"=>2,"Campaign Set-Up"=>5,"Campaign Optimization"=>3,"Content and Display"=>5, "Retargeting"=>5},"Marketing Strategy"=>{"Marketing Plan Development"=>5,"Business Plan Development"=>20,"Market Research"=>10,"Consulting"=>10},"Social Media"=>{"Facebook Management"=>10,"Twitter Management"=>10,"LinkedIn Management"=>8,"Pinterest Management"=>15,"Google+ Management"=>8,"Instagram Management"=>10,"Youtube Management"=>10,"Vine Management"=>10}}[disc][tsk]
    end
    def get_hourly(disc,tsk,tier)
        {"Email Marketing"=>{"Email Design"=>{0=>15,1=>25,2=>45},"Email Coding"=>{0=>15,1=>25,2=>45},"Email Deliverability"=>{0=>15,1=>25,2=>45}},"SEO"=>{"On Page Audit"=> {0=>20,1=>35,2=>55},"On Page Optimization"=>{0=>20,1=>35,2=>55},"Off Page Optimization"=>{0=>20,1=>35,2=>55}},"Paid Search"=>{"Campaign Research"=>{0=>25,1=>45,2=>60},"Campaign Set-Up"=>{0=>25,1=>45,2=>60},"Campaign Optimization"=>{0=>25,1=>45,2=>60},"Content and Display"=>{0=>25,1=>45,2=>60}, "Retargeting"=>{0=>25,1=>45,2=>60}},"Marketing Strategy"=>{"Marketing Plan Development"=>{0=>30,1=>50,2=>75},"Business Plan Development"=>{0=>30,1=>50,2=>75},"Market Research"=>{0=>30,1=>50,2=>75},"Consulting"=>{0=>30,1=>50,2=>75}},"Social Media"=>{"Facebook Management"=>{0=>15,1=>25,2=>40},"Twitter Management"=>{0=>15,1=>25,2=>40},"LinkedIn Management"=>{0=>15,1=>25,2=>40},"Pinterest Management"=>{0=>15,1=>25,2=>40},"Google+ Management"=>{0=>15,1=>25,2=>40},"Instagram Management"=>{0=>15,1=>25,2=>40},"Youtube Management"=>{0=>15,1=>25,2=>40},"Vine Management"=>{0=>15,1=>25,2=>40}}}[disc][tsk][tier]
    end
    def get_joboverall(jb)
        overall=0
        puts "meta? #{jb.job_meta.nil?}"
        get_idealattributes.each do |attr|
            puts attr.split[0].downcase+" " + eval("jb.job_meta.#{attr.split[0].downcase}")
        end
        get_idealattributes.each do |attribute|
            overall+=eval("jb.job_meta.#{attribute.split[0].downcase}")
        end
        overall/get_idealattributes.size.to_f
    end
    def get_overall(prov)
        overall=0
        get_idealattributes.each do |attribute|
            overall+=eval("prov.provider_meta.#{attribute.split[0].downcase}")
        end
        overall/get_idealattributes.size.to_f
    end
    def get_worst_three(prov)
        (get_idealattributes.sort_by { |element| eval("prov.provider_meta.#{element.split[0].downcase}")} ).reverse[-3..-1]
    end
    def get_best_three(prov)
        (get_idealattributes.sort_by { |element| eval("prov.provider_meta.#{element.split[0].downcase}")}).reverse[0..2]
    end
    def get_current_ranking(prov,job)
        providers=[]
        Provider.find_each do |provider|
            if provider.disciplines.pluck("name").include?(job.discipline) and provider.provider_meta.tier==job.tier
                providers<<provider
            end
        end 
        providers = providers.sort_by { |p| get_overall(p) }
        puts "size #{providers.size}"
        place=-1
        puts "is nil? #{prov.nil?}"
        providers.each_with_index do |provider, i|
            if provider.id==prov.id
                place=i
                break
            end
        end
        place
    end
    def interpolate(data)
        data_keys= data.keys
        properkeys=(data.keys.min..data.keys.max).to_a
        propervalues=[]
        data_values=data.values
        i=0
        properkeys.each do |properkey|
            if data_keys.include? properkey
                propervalues << data_values[i]
                i+=1
            else
                propervalues << 0.5*(propervalues.last+data_values[i])
            end
        end
        data =Hash[properkeys.zip(propervalues)]
        data

    end
    def get_graph_data(prov)
        data=Hash[(prov.jobs.group_by {|i| i.deadline}).map {|k,v| [k.month,average_job_overall(v)]}]
        data=interpolate(data)    
        data=data.map {|k,v| ["#{months.split[k.to_i]} 2014",v.round(2)]}
    end
    def get_graph_data_attribute(prov,attribute)
        data=Hash[(prov.jobs.group_by {|i| i.deadline}).map {|k,v| [k.month,average_job_attribute(v,attribute)]}]
        data=interpolate(data)
        data
    end
    def months
        "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"
    end
    def average_job_attribute(jobs, attr)
        sum=0
        jobs.each do |job|
            sum+=eval("job.job_meta.#{attr}")
        end
        sum/jobs.size.to_f
    end
    def average_job_overall(jobs)
        sum=0
        jobs.each do |job|
            sum+=eval("get_joboverall(job)")
        end
        sum/jobs.size.to_f
    end
    def get_jobs_by_discipline(prov,disc)
        Job.where(:provider_id=>prov.id, :by_discipline=>disc)
    end
    def get_jobs_by_skill(prov,skl)

    end
    def tiername(num)
        {0=>"Testing Ground",1=>"Tier 1",2=>"Tier 2",3=> "Tier 3"}[num]
    end
end
