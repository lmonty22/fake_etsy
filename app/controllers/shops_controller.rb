class ShopsController < ApplicationController

    before_action :set_shop, only: [:show, :edit, :update, :destroy, :shop_owner_show]

    def index
        @shops = Shop.all
    end

    def new
        # Current user is creating this shop and can't already have a shop
        @shop = Shop.new() 
    end

    def create
        @shop = Shop.create(shop_params)
        @shop.user = current_user
        redirect_to  shop_path(shop)
    end

    def show

    end

    def shop_owner_show
        # NEED TO FIGURE OUT HOW TO FIND THE SHOP THAT BELONGS TO THE CURRENT USER
        # For now, we just have it so that you can go to any ID and add /my_shop to get to the shop admin functions

    end

    def edit

    end

    def update
        @shop.update(shop_params)
        # redirect....
    end

    def destroy

    end

    private

    def shop_params
        params.require(:shop).permit(:name, :description)
    end

    def set_shop
        @shop = Shop.find(params[:id])
    end

end
