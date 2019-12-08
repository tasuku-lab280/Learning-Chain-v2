class HomeController < ApplicationController

  def index
    @posts = Post.all.paginate(page: params[:page]).search(params[:search])

    #ログインしていない状態でcurrent_userメソッドを呼ぶのを防ぐため
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page]).search(params[:search])
    end
  end
  
end