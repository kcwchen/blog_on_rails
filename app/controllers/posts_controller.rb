class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create params.require(:post).permit(:title, :body)
    redirect_to @post
  end
end
