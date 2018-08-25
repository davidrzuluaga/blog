class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    if comment.save
      flash[:success] = "Comentario creado exitosamente!"
      redirect_to post_path(comment.post_id)
    else
      flash[:danger] = "El espacio del comentario no puede estar vacio!"
      redirect_to post_path(comment.post_id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      comment = Comment.find(params[:id])
      comment.destroy
      flash[:success] = "Comentario eliminado"
      redirect_to post_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
