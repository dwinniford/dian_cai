class Order < ApplicationRecord
    belongs_to :user 
    belongs_to :restaurant 
    has_many :dish_orders 
    has_many :dishes, through: :dish_orders
    validates :name, presence: true  
    accepts_nested_attributes_for :dish_orders

    def self.sort_by_people(restaurant)
        Order.where("restaurant_id = ?", restaurant.id ).order(:people)
    end
end
