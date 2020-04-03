class CreateCuisines < ActiveRecord::Migration[6.0]
  def change
    create_table :cuisines do |t|
      t.string :chinese_name
      t.string :pinyin_name
      t.string :english_name

      t.timestamps
    end
  end
end
