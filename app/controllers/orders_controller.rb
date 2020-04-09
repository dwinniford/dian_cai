class OrdersController < ApplicationController
    before_action :set_restaurant, only: [:new, :create]
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    before_action :user_has_permission?, only: [:edit, :update, :destroy]

    def new 
        @order = @restaurant.orders.build 
    end

    def create 
        @order = @restaurant.orders.build(order_params)
        @order.user = current_user
        if @order.save 
            redirect_to edit_order_path(@order), notice: "Order was successfully created."
        else 
            render :new 
        end
    end

    def show 
       
    end

    def edit 

    end

    def update 
       if @order.update(order_params)
            redirect_to order_path(@order), notice: "Order was successfully updated."
       else 
            render :edit 
       end
    end

    def destroy 
        restaurant = @order.restaurant 
        @order.destroy 
        redirect_to restaurant_path(restaurant), notice: "Order was successfully deleted."
    end

    private 
    def set_restaurant 
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def order_params 
        params.require(:order).permit(:name, :people, :dietary_restrictions, :flavor_preferences, :description, dish_orders_attributes: [:dish_id, :quantity, :special_requests, :id] )
    end

    def set_order 
        @order = Order.find(params[:id])
    end

    def user_has_permission? 
        unless current_user == @order.user 
            redirect_to order_path(@order), alert: "You do not have permission to perform this action."
        end
    end
end
