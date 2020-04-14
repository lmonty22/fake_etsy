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
        @shop = Shop.new(shop_params)
        @shop.user = current_user
        if @shop.valid?
            @shop.save
            redirect_to  my_shop_shop_path(@shop)
        else
            render :new
        end
    end

    def show

    end

    def shop_owner_show
        #my_shop_shop_path(@shop)
    end

    def edit

    end

    def update
        @shop.update(shop_params)
        # redirect....
    end

    def destroy
        @shop.destroy
        redirect_to user_path(current_user)
    end

    private

    def shop_params
        params.require(:shop).permit(:name, :description)
    end

    def set_shop
        @shop = Shop.find(params[:id])
    end

end
