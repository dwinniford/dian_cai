class TranslationsController < ApplicationController
    def new 
        @restaurant = Restaurant.find(params[:restaurant_id])
        
    end

    def create 

    end
end
