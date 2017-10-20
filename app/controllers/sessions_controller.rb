class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:index, :create]

  def index
  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:id] = user.id
      redirect_to '/groups'
    else
      flash[:log_errors] = "Email and password do not match!"
      redirect_to '/'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to '/'
  end
end
