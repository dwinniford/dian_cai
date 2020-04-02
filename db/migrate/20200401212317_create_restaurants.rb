class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :chinese_name
      t.string :pinyin_name
      t.string :translated_name
      t.integer :user_id
      t.string :country
      t.string :province
      t.string :city
      t.string :district
      t.string :street

      t.timestamps
    end
  end
end
