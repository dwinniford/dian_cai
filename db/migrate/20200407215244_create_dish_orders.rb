class CreateDishOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_orders do |t|
      t.integer :quantity
      t.string :special_requests
      t.integer :dish_id
      t.integer :order_id

      t.timestamps
    end
  end
end
