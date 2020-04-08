class Translation < ApplicationRecord
    belongs_to :restaurant 
    has_many :dishes 
    belongs_to :language 
    belongs_to :user 
    has_many :comments 
    validates :title, presence: true 
end
