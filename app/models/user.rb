class User < ApplicationRecord
    has_many :translations 
    has_many :restaurants 
    has_secure_password 
end
