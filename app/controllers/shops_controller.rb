class ShopsController < ApplicationController

    before_action :set_shop, only: [:show, :edit, :update, :destroy, :shop_owner_show]
    before_action :authorized, except: [:show, :index]

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
        @shop.image.attach(params[:shop][:image])
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
        @shop.assign_attributes(shop_params)
        if @shop.valid?
            @shop.image.attach(params[:shop][:image])
            @shop.update(shop_params)
            redirect_to my_shop_shop_path(@shop)
        else
            render :edit
        end
        # redirect....
    end

    def destroy
        @shop.destroy
        redirect_to user_path(current_user)
    end

    private

    def shop_params
        params.require(:shop).permit(:name, :description, :image)
    end

    def set_shop
        @shop = Shop.find(params[:id])
    end

end
