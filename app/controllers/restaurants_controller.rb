class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
    before_action :user_has_permission?, only: [:edit, :update, :destroy]
    skip_before_action :check_if_logged_in, only: [:show, :index]

    def index 
        @restaurants = Restaurant.all
    end

    def new 
        @restaurant = Restaurant.new 
    end

    def create 
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to restaurant_path(@restaurant), notice: "Restaurant was successfully created."
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
            redirect_to restaurant_path(@restaurant), notice: "Restaurant was succesfully updated."
        else 
            render edit_restaurant_path(@restaurant)
        end
    end

    def destroy 
        @restaurant.destroy
        redirect_to restaurants_path, notice: "Restaurant was successfully destroyed."
    end

    private 
    def restaurant_params 
        params.require(:restaurant).permit(:chinese_name, :pinyin_name, :translated_name, :country, :province, :city, :district, :street, cuisine_ids: [])
    end

    def set_restaurant 
        @restaurant = Restaurant.find(params[:id])
    end

    def user_has_permission? 
        unless current_user == @restaurant.user 
            redirect_to restaurant_path(@restaurant), alert: "You do not have permission to perform this action."
        end
    end
end
