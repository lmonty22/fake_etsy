class SessionsController < ApplicationController

    def login

    end

    def process_login
        if @user = User.find_by(username: params[:username])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :login
        end
    end

    def logout
        session.destroy
        redirect_to login_path
    end
end