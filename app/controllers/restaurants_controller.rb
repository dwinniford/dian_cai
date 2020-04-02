class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
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
    end

    def edit 
    end

    def update 
        if @restaurant.update(restaurant_params)
            redirect_to restaurant_path(@restaurant)
        else 
            render edit_restaurant_path(@restaurant)
        end
    end

    def destroy 
        @restaurant.destroy
        redirect_to restaurants_path
    end

    private 
    def restaurant_params 
        params.require(:restaurant).permit(:chinese_name, :pinyin_name, :translated_name, :country, :province, :city, :district, :street)
    end

    def set_restaurant 
        @restaurant = Restaurant.find(params[:id])
    end
end
