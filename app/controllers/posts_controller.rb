class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]

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
      flash[:success] = "Creado con Éxito!"
      redirect_to posts_path
    else
     render :new 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user == current_user
      if @post.update(post_params)
        flash[:success] = "Modificado con Éxito!"
        redirect_to posts_path
      else
        render :edit
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      post = Post.find(params[:id])
      post.destroy
      flash[:success] = "Eliminado con Éxito!"
      redirect_to posts_path
    end
  end

private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
