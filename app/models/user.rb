class User < ApplicationRecord
    has_many :reviews
    has_many :orders
    has_many :order_items, through: :orders 
    has_many :items, through: :order_items
    has_one :shop
    
end
