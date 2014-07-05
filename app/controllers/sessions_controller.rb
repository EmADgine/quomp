class SessionsController < Devise::SessionsController
    #def create
    #    rtn=super
    #    sign_in(resource.type.underscore, resource.type.constantize.send(:find,resource.id)) unless resource.type.nil?
    #    rtn
    #end
    #
    def after_sign_in_path_for(resource)
        stored_location_for(resource)||account_url
    end
end
