class Review < ApplicationRecord
    belongs_to :user
    belongs_to :item 
    
    validates_inclusion_of :rating, :in => 1..5, message: "must be a whole number between 1 and 5"
    validates :title, presence: true
    validates :content, presence: true

end
