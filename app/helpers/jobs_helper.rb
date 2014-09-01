module JobsHelper
    def get_providers(job)
        providers=Provider.all.shuffle[0..4]
        order=(1..4).to_a.shuffle
        [[providers.first,providers.second,providers.third,providers.fourth],order]
    end
end
