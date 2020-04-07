class User < ApplicationRecord
    has_many :translations 
    has_many :restaurants 
    has_secure_password 
    # validates :password, confirmation: true, if: not_using_omniauth? 
    # validates :password_confirmation, presence: true, if: not_using_omniauth? 
    
    
    def not_using_omniauth? 
        self.uid == nil 
    end
end
