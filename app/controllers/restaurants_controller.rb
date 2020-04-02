class RestaurantsController < ApplicationController

    def index 
        @restaurants = Restaurant.all
    end

    def new 
        @restaurant = Restaurant.new 
    end

    def create 
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
        else 
            render :new 
        end
    end

    def show 
        @restaurant = Restaurant.find(params[:id])

    end

    def edit 
        @restaurant = Restaurant.find(params[:id])
    end

    def update 
        @restaurant = Restaurant.find(params[:id])
        if @restaurant.update(restaurant_params)
            redirect_to restaurant_path(@restaurant)
        else 
            render edit_restaurant_path(@restaurant)
        end
    end

    def destroy 
        Restaurant.delete(params[:id])
        redirect_to restaurants_path
    end

    private 
    def restaurant_params 
        params.require(:restaurant).permit(:chinese_name, :pinyin_name, :translated_name, :country, :province, :city, :district, :street)
    end
end
