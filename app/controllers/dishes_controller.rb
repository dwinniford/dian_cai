class DishesController < ApplicationController
    before_action :set_translation, only: [:new, :create]
    before_action :set_dish, only: [:show, :edit, :update, :destroy]
    skip_before_action :check_if_logged_in, only: [:show]
    before_action :user_has_permission?, only: [:new, :create, :edit, :update, :destroy]

    def new 
        @dish = Dish.new # change to build off translation?
       
    end

    def create 
        @dish = @translation.dishes.build(dish_params)
    

        respond_to do |format|
     
            if @dish.save
                format.html { redirect_to translation_path(@dish.translation), notice: "Dish was successfully created." }
                format.js
            else 
                format.html { render :new } 
                
            end
        end
        
    end

    def show 
       
    end

    def edit 

    end

    def update 
        if @dish.update(dish_params)
            redirect_to dish_path(@dish), notice: "Dish was successfully updated."
        else 
            render :edit
        end
    end

    def destroy 
        @translation = @dish.translation
        @dish.destroy
        redirect_to translation_path(@translation), notice: "Dish was successfully deleted."
    end

    def index 
        @restaurant = Restaurant.find(params[:restaurant_id])
        @new_order_with_dish_order = Order.new
        @new_order_with_dish_order.dish_orders.build 
    end

    private 
    def set_translation
        @translation = Translation.find(params[:translation_id])
    end

    def set_dish 
        @dish = Dish.find(params[:id])
    end

    def dish_params 
        params.require(:dish).permit(:chinese_name, :pinyin_name, :translated_name, :description, :ingredients, :spicy_level, :price, :calories, :restaurant_id)
    end

    def user_has_permission? 
        if @translation 
            unless current_user == @translation.user 
                redirect_to translation_path(@translation), alert: "You do not have permission to perform this action."
            end
        else 
            unless current_user == @dish.translation.user 
                redirect_to dish_path(@dish), alert: "You do not have permission to perform this action."
            end
        end
    end
end
