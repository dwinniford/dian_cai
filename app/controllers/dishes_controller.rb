class DishesController < ApplicationController

    def new 
        @dish = Dish.new 
        @translation = Translation.find(params[:translation_id])
    end

    def create 

    end
end
