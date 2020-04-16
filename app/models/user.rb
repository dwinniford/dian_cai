class User < ApplicationRecord
    has_many :translations 
    has_many :restaurants 
    has_many :orders 
    has_many :comments 
    has_secure_password 
    validates :name, presence: true 
    validates :name, uniqueness: true 
    validates :email, presence: true 
    validates :email, uniqueness: true 
    
    def top_rated_translations(n) 
        self.translations.sort_by { |t| t.average_rating }.reverse.first(n)
    end

    def most_recent_orders(n)
        Order.where("user_id = ?", self.id).order(created_at: :desc).first(n)
    end
    
   
end
