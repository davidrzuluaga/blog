class CommentsController < ApplicationController
  before_action :authenticate_user!

    def create
        comment = Comment.new(comment_params)
        comment.user = current_user
        if comment.save
            redirect_to post_path(comment.post_id)
        else
            
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.user == current_user
          comment = Comment.find(params[:id])
          comment.destroy
          redirect_to post_path
        end
      end
  
    private
    
      def comment_params
        params.require(:comment).permit(:content, :post_id)
      end

end
