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






end
