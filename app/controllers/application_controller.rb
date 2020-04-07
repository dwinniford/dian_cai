class ApplicationController < ActionController::Base
    def home 
        
    end

    def current_user 
        User.find(session[:user_id])
    end
end
