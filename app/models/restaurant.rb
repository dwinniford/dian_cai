class Restaurant < ApplicationRecord
    has_many :translations 
    has_many :languages, through: :translations 
    has_many :dishes 
    has_and_belongs_to_many :cuisines 
    belongs_to :user 
    has_many :orders 
    has_one_attached :restaurant_image
    
    validates :chinese_name, :translated_name, :country, :province, :city, :district, :street, presence: true 
   

    

    def top_rated_translations(n) 
        sort_translations_by_rating.first(n)
    end

    def most_recent_orders(n)
        Order.where("restaurant_id = ?", self.id).order(created_at: :desc).first(n)
    end

    def sort_translations_by_rating
        self.translations.sort_by { |t| t.average_rating }.reverse
    end

    def sort_translations_by_dishes_count
        self.translations.sort_by { |t| t.dishes.size }.reverse
    end

    
   


end
