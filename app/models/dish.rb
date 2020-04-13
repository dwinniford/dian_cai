class Dish < ApplicationRecord
    belongs_to :translation 
    belongs_to :restaurant 
    has_many :dish_orders 
    has_many :orders, through: :dish_orders 
    validates :chinese_name, :translated_name, presence: true 

    def self.sort_by_spicy(restaurant)
        Dish.where("restaurant_id = ?", restaurant.id ).order("spicy_level")
    end
end
