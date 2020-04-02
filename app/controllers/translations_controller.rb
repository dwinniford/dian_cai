class TranslationsController < ApplicationController
    def new 
        @restaurant = Restaurant.find(params[:restaurant_id])
        @translation = @restaurant.translations.build 
    end

    def create 

    end
end
