class Dish < ApplicationRecord
    belongs_to :translation 
    belongs_to :restaurant 
    has_many :dish_orders 
    has_many :orders, through: :dish_orders 
end
