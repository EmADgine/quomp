module JobsHelper
    def get_providers(job)
        puts 'getting provs'
        providers=[]
        Provider.find_each do |provider|
            if provider.disciplines.pluck("name").include?(job.discipline)
                providers<<provider
            end
        end
        providers.shuffle!
        order=(1..4).to_a.shuffle
        [[providers.first,providers.second,providers.third,providers.fourth],order]
    end
end
