class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "La entrada fue publicada con exito"
    else
     render :new 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
