class UsersController < ApplicationController
    skip_before_action :check_if_logged_in, only: [:new, :create]

    def new 
        @user = User.new 
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def show 
        @user = User.find(session[:user_id])
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
