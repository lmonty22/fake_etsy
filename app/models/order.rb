class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items 
    has_many :items, through: :order_items

    def total 
        self.items.all.map {|item| item.price}.sum
    end

    def num_of_items
        self.items.count
    end

   
end
