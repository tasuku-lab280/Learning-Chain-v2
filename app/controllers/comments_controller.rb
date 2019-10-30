class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @post=Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "コメントが投稿されました！"
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "コメントが削除されました。"
    redirect_to  request.referrer || root_url
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end
end