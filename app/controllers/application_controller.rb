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

    def analytics
        @total_shops = Shop.total_shops
        @active_shops = Shop.active_shops
        @inactive_shops = Shop.inactive_shops
        @items_sold = Item.items_sold
        @items_listed = Item.items_listed
        @items_unlisted = Item.items_unlisted
        @gross_revenue = Item.gross_revenue
    end

end
