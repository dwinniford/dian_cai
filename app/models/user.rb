class User < ApplicationRecord
    has_many :translations 
    has_many :restaurants 
    has_many :orders 
    has_many :comments 
    has_secure_password 
    validates :name, presence: true 
    validates :email, presence: true 
    # validates :password, confirmation: true 
    # validates :password_confirmation, presence: true
    
    
   
end
