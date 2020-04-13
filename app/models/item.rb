class Item < ApplicationRecord
    belongs_to :shop
    has_many :reviews
    has_many :order_items
    has_many :orders, through: :order_items
    
end
