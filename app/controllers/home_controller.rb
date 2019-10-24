class HomesController < ApplicationController

  def index
    @posts = Post.all.paginate(page: params[:page]).search(params[:search])
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page]).search(params[:search])
    end
  end
  
end