module ApplicationHelper


    def link_to_remove_fields(name, f)
        f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
    end

    def add_fields_arguments(f, association, name)
        new_object = f.object.send(association).klass.new
        new_object.name = name 
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render(association.to_s.singularize + "_fields", f: builder)
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
        if link=nil
            link=''
        end
        link.chomp('http://').chomp('www.').downcase
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
        ['Professional Services','Graphic Design','Marketing','Web Development']
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
end
