class CommentsController < ApplicationController
    before_action :set_translation, only: [:new, :create]
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    skip_before_action :check_if_logged_in, only: [:show]
    before_action :user_has_permission?, only: [:edit, :update, :destroy]
    
    def new 
        @comment = @translation.comments.build
    end

    def create 
        @comment = @translation.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save 
            redirect_to translation_path(@translation), notice: "Comment was successfully posted."
        else 
            render :new 
        end
    end

    def show 

    end

    def index 
        @user = User.find(params[:user_id])
    end
        

    def edit 

    end

    def update 
        if @comment.update(comment_params)
            redirect_to translation_path(@comment.translation), notice: "Comment was successfully updated."
        else 
            render :edit 
        end
    end

    def destroy 
        @translation = @comment.translation 
        @comment.destroy 
        redirect_to translation_path(@translation), notice: "Comment was successfully deleted."
    end

    private 
    def set_translation 
        @translation = Translation.find(params[:translation_id])
    end
    
    def comment_params 
        params.require(:comment).permit(:title, :content, :rating)
    end

    def set_comment 
        @comment = Comment.find(params[:id])
    end

    def user_has_permission? 
        unless current_user == @comment.user 
            redirect_to comment_path(@comment), alert: "You do not have permission to perform this action."
        end
    end
end
