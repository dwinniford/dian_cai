class TranslationsController < ApplicationController
    before_action :set_restaurant, only: [:new, :create]
    
    def new 
        @translation = @restaurant.translations.build 
    end

    def create 
        @translation = @restaurant.translations.build(translation_params)
        if @translation.save 
            redirect_to restaurant_translation_path(@translation)
        else 
            render :new 
        end
    end

    private 

    def set_restaurant 
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def translation_params 
        params.require(:translation).permit(:title, :notes, :language_id)
    end
end
