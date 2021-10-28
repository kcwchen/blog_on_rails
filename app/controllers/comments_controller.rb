class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.new params.require(:comment).permit(:body)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: "Comment submitted"
    else
      @comments = @post.comments.order(created_at: :desc)
      render 'posts/show'
    end
  end

  def destroy
    @post = Post.find params[:post_id]
    @comment = Comment.find params[:id]
    if can?(:crud, @comment)
      @comment.destroy
      redirect_to post_path(@post), notice: "Comment Deleted"
    else
      redirect_to post_path(@post), alert: "Not Authorized"
    end
  end
end
