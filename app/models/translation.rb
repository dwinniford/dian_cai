class Translation < ApplicationRecord
    belongs_to :restaurant 
    has_many :dishes 
    belongs_to :language 
    belongs_to :user 
    has_many :comments 
    validates :title, presence: true 
    has_one_attached :menu 

    def average_rating 
        if self.comments.size > 0
            self.comments.map { |c| c.rating }.sum/self.comments.size
        else 
            0
        end 
    end

    

    
end
