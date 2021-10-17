class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy, :edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show

  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post Deleted"
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
