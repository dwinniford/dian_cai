class Language < ApplicationRecord
    has_many :translations 
    has_many :restaurants, through: :translations 
end
