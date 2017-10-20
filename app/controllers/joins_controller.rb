class JoinsController < ApplicationController

    def create
        Join.create(user:User.find(session[:id]), organization:Organization.find(params[:org_id]))
        redirect_to "/groups"
    end

    def destroy
        join = Join.where(user:User.find(session[:id]), organization:Organization.find(params[:org_id]))
        join.destroy(join)
        redirect_to "/groups"
    end
end
