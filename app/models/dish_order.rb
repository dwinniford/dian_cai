class DishOrder < ApplicationRecord
    belongs_to :dish 
    belongs_to :order 

    def increment_quantity
        if self.quantity == nil 
            self.quantity = 1
        else 
            self.quantity += 1
        end
    end
end
