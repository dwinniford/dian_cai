class Order < ApplicationRecord
    belongs_to :user 
    belongs_to :restaurant 
    has_many :dish_orders 
    has_many :dishes, through: :dish_orders
    validates :name, :people, :dishes, presence: true 
end
