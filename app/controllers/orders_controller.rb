class OrdersController < ApplicationController

    def new 
        @restaurant = Restaurant.find(params[:restaurant_id])
        @order = @restaurant.orders.build 
    end

    def create 

    end
end
