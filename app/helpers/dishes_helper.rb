module DishesHelper
    def dish_subheading_links(d)
        # "at: #{link_to(all_names(@dish.restaurant), restaurant_path(@dish.restaurant))} on: #{link_to(@dish.translation.title, translation_path(@dish.translation))} by: User Name"
        link_to("at: #{all_names(@dish.restaurant)}", restaurant_path(@dish.restaurant))
    end

    def dish_info(d) 
        "Spicy level: #{d.spicy_level}/5 - #{d.price} yuan"
    end
end
