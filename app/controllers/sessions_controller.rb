class SessionsController < ApplicationController

    def login

    end

    def process_login
        user = User.find_by(username: params[:username])
        if  user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash["error"] = "No user found with this username and password"
            render :login
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end
end