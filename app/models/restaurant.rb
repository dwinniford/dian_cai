class Restaurant < ApplicationRecord
    has_many :translations 
    has_many :languages, through: :translations 
    has_many :dishes 
    has_and_belongs_to_many :cuisines 
    belongs_to :user 
    validates :chinese_name, presence: true 
    validates :translated_name, presence: true 

    def full_address
        "#{country}, #{province}, #{city}, #{district}, #{street}"
    end
end
