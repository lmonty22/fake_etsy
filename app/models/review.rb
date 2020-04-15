class Review < ApplicationRecord
    belongs_to :user
    belongs_to :item 
    validates_inclusion_of :rating, :in => 1..5, message: "must be a whole number between 1 and 5"
    validates :title, presence: true
    validates :content, presence: true
    validate :purchase
    validate :duplicate_reviews


    def purchase
        #verify that current user has purchased the item 
        user = User.find(user_id)
        if !user.item_ids.include?(item_id)
            errors.add(:item_id, "You cannot write a review for an item you haven't purchased.")
        end
    end

    def duplicate_reviews
        #verify that the current user has not already reviewed this item. 
        user = User.find(user_id)
        if user.reviewed_item_ids.include?(item_id)
            errors.add(:item_id, "You cannot write more than one review for an item.")
        end
    end

end
