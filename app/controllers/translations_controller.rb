class TranslationsController < ApplicationController
    before_action :set_restaurant, only: [:new, :create]
    before_action :set_translation, only: [:show, :edit, :update, :destroy]
    
    def new 
        @translation = @restaurant.translations.build 
    end

    def create 
        @translation = @restaurant.translations.build(translation_params)
        if @translation.save 
            redirect_to translation_path(@translation)
        else 
            render :new 
        end
    end

    def show 
        @dish = Dish.new
    end

    def edit 

    end

    def update 
        binding.pry
        if @translation.update(translation_params)
            redirect_to translation_path(@translation)
        else 
            render :edit 
        end
    end

    def destroy 
        @restaurant = @translation.restaurant 
        @translation.destroy
        redirect_to restaurant_path(@restaurant)
    end

    private 

    def set_restaurant 
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def translation_params 
        params.require(:translation).permit(:title, :notes, :language_id)
    end

    def set_translation
        @translation = Translation.find(params[:id])
    end
end
