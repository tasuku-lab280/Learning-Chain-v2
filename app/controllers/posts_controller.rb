class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user = User.find_by(id: @post.user_id)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "勉強記録が投稿されました！"
      redirect_to root_url
    else
      @feed_items = []
      render 'new'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました。"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:content, :title, :material, :image, tag_ids: [])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end