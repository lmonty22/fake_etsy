class OrderItemsController < ApplicationController

    def checkout
        order = Order.create(user: current_user)
        current_cart.each do |i| 
            OrderItem.create(item_id: i, order_id: order.id)
            item = Item.find(i)
            item.quantity -= 1 
            item.save
        end
        session[:cart] = []
        redirect_to user_path(current_user)
    end
end
