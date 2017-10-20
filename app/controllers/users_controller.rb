class UsersController < ApplicationController

    skip_before_action :require_login, only: [:create]

    def create
        user = User.new(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
        if user.valid?
            user.save
            flash[:success] = "Successfully created user. Please Log in!"
            redirect_to '/'
        else
            flash[:reg_errors] = user.errors.full_messages
            redirect_to '/'
        end
    end
end
