class Dish < ApplicationRecord
    belongs_to :translation 
    belongs_to :restaurant 
end
