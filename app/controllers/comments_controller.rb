class CommentsController < ApplicationController

    def new 
        @translation = Translation.find(params[:translation_id])
        @comment = @translation.comments.build
    end
end
