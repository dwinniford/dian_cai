class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.string :title
      t.string :notes
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :language_id

      t.timestamps
    end
  end
end
