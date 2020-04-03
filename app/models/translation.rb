class Translation < ApplicationRecord
    belongs_to :restaurant 
    has_many :dishes 
end
