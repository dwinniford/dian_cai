class User < ApplicationRecord
    has_many :translations 
    has_many :restaurants 
    has_many :orders 
    has_secure_password 
    # validates :password, confirmation: true 
    # validates :password_confirmation, presence: true
    
    
   
end
