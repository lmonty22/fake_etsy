class ItemsController < ApplicationController


    before_action :set_item, only: [:show, :edit, :update, :destroy]

    def index
        @items = Item.all
    end

    def new
        # Current user is creating this shop and can't already have a shop
        @item = Item.new() 
    end

    def create
        @item = Item.new(item_params)
        @item.shop = current_user.shop
        if @item.valid?
            @item.save
            redirect_to  item_path(@item)
        else
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        @item.update(item_params)
        # redirect....
    end

    def destroy
        @item.destroy
        redirect_to my_shop_shop_path(current_user.shop)
    end

    private

    def item_params
        params.require(:item).permit(:name, :description, :price, :quantity)
    end

    def set_item
        @item = Item.find(params[:id])
    end
end
