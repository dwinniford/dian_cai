class RestaurantsController < ApplicationController

    def index 

    end

    def new 
        @restaurant = Restaurant.new 
    end

    def create 
        restaurant = Restaurant.new(restaurant_params)
        if restaurant.save 
            redirect_to restaurant_path(restaurant)
        else 
            render '/restaurants/new'
        end
    end

    def show 

    end

    private 
    def restaurant_params 
        params.require(:restaurant).permit(:name_chinese, :name_pinyin, :name_english, :country, :province, :city, :district, :street)
    end
end
