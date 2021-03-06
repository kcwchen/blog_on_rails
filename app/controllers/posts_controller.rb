class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    if can?(:crud, @post)
      @post.destroy
      redirect_to posts_path, notice: "Post Deleted"
    else
      redirect_to post_path(@post), alert: "Not Authorized"
    end
  end

  def edit
    if can?(:crud, @post)
      render :edit
    else
      redirect_to post_path(@post), alert: "Not Authorized"
    end
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
