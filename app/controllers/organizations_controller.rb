class OrganizationsController < ApplicationController
  def home
    @org = Organization.all
  end

  def create
    org = Organization.new(name:params[:name], desc:params[:desc], user:User.find(session[:id]))
    if org.valid?
      org.save
      redirect_to '/groups'
    else
      flash[:errors] = org.errors.full_messages
      redirect_to '/groups'
    end
  end

  def show
    @group = Organization.find(params[:org_id])
    @users = Organization.find(params[:org_id]).joined_users
  end

  def destroy
    org = Organization.find(params[:org_id])
    org.destroy
    redirect_to '/groups'
  end
end
