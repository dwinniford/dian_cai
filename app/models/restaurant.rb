class Restaurant < ApplicationRecord
    validates :chinese_name, presence: true 
    validates :translated_name, presence: true 
end
