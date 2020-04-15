class Item < ApplicationRecord
    #not sure if we want to make the image work here..
    has_one_attached :image
    belongs_to :shop
    has_many :reviews
    has_many :order_items
    has_many :orders, through: :order_items
    validates :name, :price, :quantity, :description, presence: true
    
end
