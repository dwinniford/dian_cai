class Restaurant < ApplicationRecord
    has_many :translations 
    has_many :dishes 
    has_and_belongs_to_many :cuisines 
    validates :chinese_name, presence: true 
    validates :translated_name, presence: true 
end
