class Restaurant < ApplicationRecord
    validates :name_chinese, presence: true 
    validates :name_english, presence: true 
end
