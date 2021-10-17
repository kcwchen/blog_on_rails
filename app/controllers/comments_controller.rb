class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = Comment.new params.require(:comment).permit(:body)
    @comment.post = @post
    if @post.save
      redirect_to post_path(@post), notice: "Comment submitted"
    else
      @comments = @post.comments.order(created_at: :desc)
      render 'post/show'
    end
  end
end
