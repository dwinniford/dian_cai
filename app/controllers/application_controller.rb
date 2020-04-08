class ApplicationController < ActionController::Base
    before_action :check_if_logged_in, except: [:home]
    # skip_before_action :check_if_logged_in, only: [:home]
    
    def home 
        
    end

    def current_user 
        User.find(session[:user_id])
    end

    private 

    def logged_in?
        !!session[:user_id]
    end

    def check_if_logged_in 
        unless logged_in?
            
            redirect_to root_path, alert: "Please Log in or Sign up"
        end
    end
end
