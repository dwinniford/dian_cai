class DishesController < ApplicationController

    def new 
        @dish = Dish.new # change to build off translation?
        @translation = Translation.find(params[:translation_id])
    end

    def create 

    end
end
