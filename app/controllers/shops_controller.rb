class ShopsController < ApplicationController

    before_action :set_shop, only: [:show, :edit, :update, :shop_owner_show, :change_shop_status, :shop_orders]
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
        if @shop.user == current_user
            render :shop_owner_show
        else
            redirect_to shops_path
        end
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
    end

    def change_shop_status
        @shop.items.each do |item|
            if item.listed == true
                item.change_listing_status
                item.save
            end
        end
        @shop.change_status
        redirect_to my_shop_shop_path(current_user.shop)
    end

    def shop_orders
        if @shop.user == current_user
            render :shop_orders
        else
            redirect_to shops_path
        end
    end

    private

    def shop_params
        params.require(:shop).permit(:name, :description, :image)
    end

    def set_shop
        @shop = Shop.find(params[:id])
    end

end
