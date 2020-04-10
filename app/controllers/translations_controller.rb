class TranslationsController < ApplicationController
    before_action :set_restaurant, only: [:new, :create]
    before_action :set_translation, only: [:show, :edit, :update, :destroy]
    skip_before_action :check_if_logged_in, only: [:show]
    before_action :user_has_permission?, only: [:edit, :update, :destroy]
    
    
    def new 
        @translation = @restaurant.translations.build 
    end

    def create 
        @translation = @restaurant.translations.build(translation_params)
        @translation.user = current_user 
        if @translation.save 
            redirect_to translation_path(@translation), notice: "Translation was successfully created."
        else 
            render :new 
        end
    end

    def show 
        @dish = Dish.new
    end

    def index 
        if params[:restaurant_id]
            set_restaurant
            if params[:order_by]
                if params[:order_by] == "average_rating"
                    @translations = @restaurant.sort_translations_by_rating
                elsif params[:order_by] == "number_of_dishes"

                elsif params[:order_by] == "created_at"

                else 
                    @translations = @restaurant.translations
                end
            end
        else 
            @user= User.find(params[:user_id])
            @translations = @user.translations
        end
    end

    def edit 

    end

    def update 
        if @translation.update(translation_params)
            redirect_to translation_path(@translation), notice: "Translation was succesfully updated."
        else 
            render :edit 
        end
    end

    def destroy 
        @restaurant = @translation.restaurant 
        @translation.destroy
        redirect_to restaurant_path(@restaurant), notice: "Translation was successfully destroyed."
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

    def user_has_permission? 
        unless current_user == @translation.user 
            redirect_to translation_path(@translation), alert: "You do not have permission to perform this action."
        end
    end
end
