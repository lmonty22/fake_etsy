class User < ApplicationRecord
    has_one_attached :image
    has_secure_password
    has_many :reviews
    has_many :orders
    has_many :order_items, through: :orders 
    has_many :items, through: :order_items
    has_one :shop
    validates :username, :uniqueness => {:case_sensitive => false}, presence: true


    def item_ids
        #returns an array of item ids that the user has purchased
        self.items.map do |item|
            item.id
        end
    end

    def reviewed_item_ids
        #returns an array of item ids that the user has reviewed 
        self.reviews.map do |review|
            review.item_id
        end
    end

    def total_orders
        self.orders.count
    end
end
