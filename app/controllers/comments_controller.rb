class CommentsController < ApplicationController
    before_action :set_translation, only: [:new, :create]
    
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
        @comment = Comment.find(params[:id])
    end

    private 
    def set_translation 
        @translation = Translation.find(params[:translation_id])
    end
    
    def comment_params 
        params.require(:comment).permit(:title, :content, :rating)
    end
end
