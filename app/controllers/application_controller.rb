class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :authorized
    helper_method :current_cart


    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        if !logged_in?
            flash["error"] = "You must be logged in"
            redirect_to login_path
        end
    end

    def current_cart
        session[:cart] ||= []
    end


end
