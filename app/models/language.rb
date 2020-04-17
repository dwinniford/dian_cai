class Language < ApplicationRecord
    has_many :translations 
    has_many :restaurants, through: :translations 

    def self.restaurants_from_id(language_id)
        Language.find(language_id).restaurants.uniq
    end
end
