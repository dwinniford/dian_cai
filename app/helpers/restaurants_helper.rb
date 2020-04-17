module RestaurantsHelper

    def full_address(r)
        "#{r.country}, #{r.province}, #{r.city}, #{r.district}, #{r.street}"
    end
    
    
end
