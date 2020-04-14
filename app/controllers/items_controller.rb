class ItemsController < ApplicationController


    before_action :set_item, only: [:show, :edit, :update, :destroy, :add_to_cart]

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
        @item.assign_attributes(item_params)
        if @item.valid?
            @item.save
            redirect_to item_path(@item)
        else 
            render :edit
        end
    end

    def destroy
        @item.destroy
        redirect_to my_shop_shop_path(current_user.shop)
    end

    
    def add_to_cart
        # Get the item from the path
        @item = Item.find(params[:id])
        # Load the cart from the session, or create a new empty cart.
        current_cart << @item.id
        flash[:add_to_cart] = "#{@item.name} has been added to your cart."  
        redirect_to shop_path(@item.shop)
    end

    def remove_from_cart
        id = params[:id].to_i
        index = 0 
        while index < current_cart.length do 
            if current_cart[index] == id
                current_cart.delete_at(index)
            end
            index += 1
        end
        flash[:remove_from_cart] ="Item removed from cart."
        redirect_to my_cart_path(current_user)
    end

    private

    def item_params
        params.require(:item).permit(:name, :description, :price, :quantity)
    end

    def set_item
        @item = Item.find(params[:id])
    end
end
