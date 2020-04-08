class CommentsController < ApplicationController
    before_action :set_translation, only: [:new, :create]
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    skip_before_action :check_if_logged_in, only: [:show]
    
    def new 
        @comment = @translation.comments.build
    end

    def create 
        @comment = @translation.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save 
            redirect_to translation_path(@translation)
        else 
            render :new 
        end
    end

    def show 

    end
        

    def edit 

    end

    def update 
        if @comment.update(comment_params)
            redirect_to translation_path(@comment.translation)
        else 
            render :edit 
        end
    end

    def destroy 
        @translation = @comment.translation 
        @comment.destroy 
        redirect_to translation_path(@translation)
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
end
