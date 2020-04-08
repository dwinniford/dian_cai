class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :translation 
    validates :title, :content, :rating, presence: true 
end
