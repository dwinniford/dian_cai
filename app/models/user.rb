class User < ApplicationRecord
    has_many :translations 
    has_many :restaurants 
end
