class DishesController < ApplicationController
    before_action :set_translation, only: [:new, :create]
    def new 
        @dish = Dish.new # change to build off translation?
    end

    def create 
        @dish = @translation.dishes.build(dish_params)
        if @dish.save 
            redirect_to dish_path(@dish)
        else 
            render :new 
        end
    end

    def show 
        @dish = Dish.find(params[:id])
    end

    private 
    def set_translation
        @translation = Translation.find(params[:translation_id])
    end

    def dish_params 
        params.require(:dish).permit(:chinese_name, :pinyin_name, :translated_name, :description, :ingredients, :spicy_level, :price, :calories, :restaurant_id)
    end
end
