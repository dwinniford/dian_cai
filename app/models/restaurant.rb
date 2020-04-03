class Restaurant < ApplicationRecord
    has_many :translations 
    has_many :dishes 
    validates :chinese_name, presence: true 
    validates :translated_name, presence: true 
end
