class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def index
    if logged_in?
      @posts = Post.all.where.not(user_id: current_user.id).page(params[:page])
    else
      @posts = Post.all.page(params[:page])
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
    @comment = Comment.new
    @comments = @post.comments
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

  def edit
    @post = Post.find(params[:id]) 
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "勉強記録が更新されました！"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました。"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:content, :title, :material, :tag, :image)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end