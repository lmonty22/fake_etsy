class SessionsController < ApplicationController

    def login

    end

    def process_login
        user = User.find_by(username: params[:username])
        if  user && user.authenticate(params[:password])
            session[:user_id] = user.id
            if cookies["last_item_visited"]
                redirect_to item_path(cookies["last_item_visited"])
            else
                redirect_to user_path(user)
            end
        else
            flash["error"] = "No user found with this username and password"
            render :login
        end
    end

    def logout
        session.clear
        cookies.delete(:last_item_visited)
        redirect_to login_path
    end
end