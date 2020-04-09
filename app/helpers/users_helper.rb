module UsersHelper

    def current_user
        User.find(session[:user_id])
    end

    def logged_in? 
        !!session[:user_id]
    end

    def user_has_permission?(o)
        logged_in? && current_user == o.user
    end 
end
