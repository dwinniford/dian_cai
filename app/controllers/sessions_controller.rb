class SessionsController < ApplicationController
    skip_before_action :check_if_logged_in, only: [:new, :create, :facebook]

    def new 
        @user = User.new 
    end

    def facebook
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.password= SecureRandom.hex
           
        end
        
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end

    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def destroy 
        session[:user_id] = nil 
        redirect_to root_path
    end

    private 
    def auth 
        request.env['omniauth.auth']
    end
end
