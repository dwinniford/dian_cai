module ApplicationHelper
    def all_names(o) 
        "#{o.chinese_name} - #{o.pinyin_name} - #{o.translated_name}"
    end
end
