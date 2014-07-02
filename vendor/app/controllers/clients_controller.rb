class ClientsController < ApplicationController
=begin
    def show
        @client = Client.find(params[:id])
    end
    def edit
        @client = Client.find(params[:id])
    end
    def update
        @client = Client.find(params[:id])
        if @client.update_attributes(client_params_edit)
            flash[:success] = "Profile Updated"
            redirect_to @client
        else
            flash[:failure] = "Profile Information Invalid"
            render 'edit'
        end
    end
    def client_params_edit
        params.require(:client).permit(:avatar,:industry,:city,:website, :description)
    end
=end
end
