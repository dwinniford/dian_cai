class Translation < ApplicationRecord
    belongs_to :restaurant 
    has_many :dishes 
    belongs_to :language 
end
