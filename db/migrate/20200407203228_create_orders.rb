class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :name
      t.integer :people
      t.string :dietary_restrictions
      t.string :flavor_preferences
      t.text :description

      t.timestamps
    end
  end
end
