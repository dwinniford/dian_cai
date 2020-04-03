class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :chinese_name
      t.string :pinyin_name
      t.string :translated_name
      t.text :description
      t.string :ingredients
      t.integer :spicy_level
      t.integer :price
      t.integer :calories
      t.integer :restaurant_id
      t.integer :translation_id

      t.timestamps
    end
  end
end
