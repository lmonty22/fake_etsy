class Item < ApplicationRecord
    #not sure if we want to make the image work here..
    has_one_attached :image
    belongs_to :shop
    has_many :reviews
    has_many :order_items
    has_many :orders, through: :order_items
    validates :name, :price, :quantity, :description, presence: true
    validate :check_shop_status


    def change_listing_status
        self.listed = !self.listed
    end

    def check_shop_status
        shop = Shop.find(shop_id)
        if shop.status == false 
            errors.add(:shop_id, "You cannot re-list an item or add an item for a shop that is deactivated")
        end
    end

    def average_rating
        if self.reviews.length > 0
            sum = 0
            self.reviews.each do |review|
                sum += review.rating
            end
            average = (sum / self.reviews.length).to_f.round(2)
        end
    end


    def self.items_sold
        OrderItem.all.count
    end

    def self.items_listed
        self.all.where(listed: true).count
    end

    def self.items_unlisted
        self.all.where(listed: false).count
    end

    def self.gross_revenue
        OrderItem.all.map {|order_item| order_item.item.price}.sum
    end

    def self.all_listed_items
        self.all.where(listed: true)
    end
end
