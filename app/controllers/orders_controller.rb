class OrdersController < ApplicationController
    before_action :set_restaurant, only: [:new, :create]
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def new 
       
        @order = @restaurant.orders.build 
    end

    def create 
        @order = @restaurant.orders.build(order_params)
        @order.user = current_user
        if @order.save 
            redirect_to order_path(@order)
        else 
            render :new 
        end
    end

    def show 
       
    end

    def edit 

    end

    private 
    def set_restaurant 
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def order_params 
        params.require(:order).permit(:name, :people, :dietary_restrictions, :flavor_preferences, :description)
    end

    def set_order 
        @order = Order.find(params[:id])
    end
end
