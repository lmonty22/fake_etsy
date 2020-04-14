class Shop < ApplicationRecord
    belongs_to :user
    has_many :items
    has_many :reviews, through: :items
    has_many :order_items, through: :items 
    has_many :orders, through: :order_items

    validates :name, presence: true
    validates :description, presence: true
end
