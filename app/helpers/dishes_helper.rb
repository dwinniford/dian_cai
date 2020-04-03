module DishesHelper
    def all_names(dish) 
        "#{dish.chinese_name} - #{dish.pinyin_name} - #{dish.translated_name}"
    end
end
