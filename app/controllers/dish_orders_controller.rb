class DishOrdersController < ApplicationController

    def create 
        dish = Dish.find(params[:dish_id])
        dish_order = dish.dish_orders.build(dish_order_params)
        if dish_order.save 
            @order = dish_order.order 
            redirect_to edit_order_path(@order), notice: "Dish was successfully added to order."
        else 
            flash.alert= "Dish was not added to order." 
            render template: "dishes/index"
        end 
    end

    def destroy 
        dish_order = DishOrder.find(params[:id])
        order = dish_order.order
        dish_order.destroy 
        redirect_to order_path(order), notice: "Dish was successfully removed from order."

    end

    private 
    def dish_order_params
        params.require(:dish_order).permit(:order_id)
    end
end