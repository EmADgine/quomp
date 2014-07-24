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

    def add_fields_arguments(f, association,name,exists)
        unless exists
            new_object = f.object.send(association).klass.new
        else
            new_object = f.object.send(association).klass.find_by_name(name)
        end
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render partial: association.to_s.singularize + "_fields", :locals =>{:f=> builder, :nom=> name}
        end
        {fields: fields.gsub("\n",""), id: id}
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
        ['Basic Materials','Chemicals','Automotive','Food & Beverage','Personal & Household Goods','Media & Entertainment','Retail','Travel & Leisure','Banks','Financial Services','Insurance','Health Care','Construction & Materials','Industrial Goods & Services', 'Oil & Gas','Technology','Telecommunications','Utilities','Government']
    end
    def get_educations
        ['PhD','Master\'s','Bachelor\'s', 'High School Diploma']
    end
    def get_disciplines
        {
            ms: "Marketing Strategy",
            em: "Email Marketing",
            ps: "Paid Search",
            am: "Affiliate Marketing",
            seo: "SEO",
            sm: "Social Media"
        }
    end
    def get_skills_by_discipline(discipline)
        {

        }
    end
    def get_tasks_by_discipline(discipline)
        ['Create a Logo', 'Build a Web Page', 'Purchase a Pony']
    end
end
