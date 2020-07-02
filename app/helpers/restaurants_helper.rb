module RestaurantsHelper

    def full_address(r)
        "#{r.country}, #{r.province}, #{r.city}, #{r.district},\n\n#{r.street}"
    end

    def restaurant_cuisines(r)
        r.cuisines.map { |c| c.english_name }.join(", ")  
    end

    
    
    
end
