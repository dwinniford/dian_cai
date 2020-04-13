class Order < ApplicationRecord
    belongs_to :user 
    belongs_to :restaurant 
    has_many :dish_orders 
    has_many :dishes, through: :dish_orders
    validates :name, presence: true  
    accepts_nested_attributes_for :dish_orders

    scope :sort_by_people, -> {order(:people)}

   

    

    def self.search_dietary_restrictions(restaurant, kw)
        Order.where("restaurant_id = ? AND dietary_restrictions LIKE ?", restaurant.id, "%#{kw}%" )
    end

    def self.search_flavor_preferences(restaurant, kw)
        Order.where("restaurant_id = ? AND flavor_preferences LIKE ?", restaurant.id, "%#{kw}%" )
    end
end
