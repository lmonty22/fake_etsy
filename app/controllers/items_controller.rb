class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :add_to_cart, :change_item_listing]
    before_action :authorized, except: [:show, :index]

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
        @item.image.attach(params[:item][:image])
        if @item.valid?
            @item.save
            redirect_to  item_path(@item)
        else
            render :new
        end
    end

    def show
        cookies["last_item_visited"] = params[:id]
    end

    def edit

    end

    def update
        @item.assign_attributes(item_params)
        @item.image.attach(params[:item][:image])
        #add listed?
        if @item.valid?
            @item.save
            redirect_to item_path(@item)
        else 
            render :edit
        end
    end

    def change_item_listing
        @item.change_listing_status
        if @item.valid?
            redirect_to my_shop_shop_path(current_user.shop)
        else
            flash["relist_error"] = "You cannot re-list an item for a deactivated shop"
            redirect_to my_shop_shop_path(current_user.shop)
        end
    end

    def add_to_cart
        # Get the item from the path
        @item = Item.find(params[:id])
        # Load the cart from the session, or create a new empty cart.
        if logged_in?
            current_cart << @item.id
            flash[:add_to_cart] = "#{@item.name} has been added to your cart."  
            redirect_to shop_path(@item.shop)
        else
            flash[:not_logged_in] = "Please log in to add this item to your cart."
            redirect_to login_path
        end
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
        params.require(:item).permit(:name, :description, :price, :quantity, :image)
    end

    def set_item
        @item = Item.find(params[:id])
    end
end
