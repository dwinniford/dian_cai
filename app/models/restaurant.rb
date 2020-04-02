class Restaurant < ApplicationRecord
    has_many :translations 
    validates :chinese_name, presence: true 
    validates :translated_name, presence: true 
end
