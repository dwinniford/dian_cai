class CreateCuisineRestaurantJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :cuisines, :restaurants do |t|
      t.index :restaurant_id
      t.index :cuisine_id
    end
  end
end
