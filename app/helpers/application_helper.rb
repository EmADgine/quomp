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
    def get_discipline_key(discipline)
        map={"Email Marketing"=>"EM","Marketing Strategy"=> "MS","Paid Search"=>"PS","Social Media"=>"SM","SEO"=>"SEO"}
        map[discipline]
    end
    def file_by_ptype(ptype)
        map={"agency"=>"Sales Collateral","freelancer"=>"Resumé"}
        map[ptype]
    end
    def get_idealattributes
        ["Timeliness","Responsiveness","Knowledge","Quality of Work","Professionalism","Likeability"]
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
    def  get_badges
       def func x
           ": Completed 5 jobs that scored greater than 9.5 out of 10 on "+x
        end
        {"rainmaker"=>["Rainmaker: Highest Project Value","umbrella"],"workhorse"=>["Work Horse: Most Projects Completed","coffee"],"highfligher"=>["High Flyer: Biggest Rankings Jump","space-shuttle"],"milestonejuggernaut"=>["Milestone Juggernaut"+func('timeliness'),"clock-o"],"firstresponder"=>["First Responder"+func('responsiveness'),"bolt"],"encyclopedia"=>['Encyclopedia'+func('knowledge'),'book'],"killerquality"=>["Killer Quality"+func('quality of work'),'bullseye'],"trueprofessional"=>["True Professional"+func('professionalism'),'briefcase'],"bestbuddy"=>["Best Buddy"+func('likeability'),'beer'],"therock"=>["The Rock: Maintained a high average and didn't deviate",'bank']}
    end
    def get_badge(name)
        get_badges[name]
    end

    def get_worst_three(provider)

    end
    def get_best_three(provider)

    end
    def get_ranking_history(provider)

    end
    def get_jobs_by_discipline(provider,discipline)
        Job.where(:provider_id=>provider.id, :by_discipline=>discipline)
    end
    def get_jobs_by_skill(provider,skill)

    end
    def tiername(num)
        {0=>"Testing Ground",1=>"Tier 1",2=>"Tier 2",3=> "Tier 3"}[num]
    end
end
