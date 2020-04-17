class Shop < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :items
    has_many :reviews, through: :items
    has_many :order_items, through: :items 
    has_many :orders, through: :order_items
    validates :name, presence: true
    validates :description, presence: true
    validates_uniqueness_of :user, message: "cannot have more than one shop."

    def listed_items
        self.items.select do |item|
            item.listed == true
        end 
    end

    def unlisted_items
        self.items.select do |item|
            item.listed == false
        end 
    end

    def items_sold
        self.order_items.count
    end


    def change_status
        self.status = !self.status
        self.save
    end

    def self.total_shops
        self.all.count
    end

    def self.active_shops
        self.all.where(status: true).count
    end

    def self.inactive_shops
        self.all.where(status: false).count
    end

end
