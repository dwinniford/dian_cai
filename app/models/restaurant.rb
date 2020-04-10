class Restaurant < ApplicationRecord
    has_many :translations 
    has_many :languages, through: :translations 
    has_many :dishes 
    has_and_belongs_to_many :cuisines 
    belongs_to :user 
    has_many :orders 
    
    validates :chinese_name, :translated_name, :country, :province, :city, :district, :street, presence: true 
   

    def full_address
        "#{country}, #{province}, #{city}, #{district}, #{street}"
    end

    def top_rated_translations(n) 
        self.translations.sort_by { |t| t.average_rating }.reverse.first(n)
    end

    def most_recent_orders(n)
        Order.where("restaurant_id = ?", self.id).order(created_at: :desc).first(n)
    end
end
