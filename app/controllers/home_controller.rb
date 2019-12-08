class HomeController < ApplicationController

  def index
    #ログインしていない状態でcurrent_userメソッドを呼ぶのを防ぐため
    if logged_in?
      @q = current_user.feed.ransack(params[:q])
      @feed_items = @q.result(distinct: true).page(params[:page])
    else
      @q = Post.all.ransack(params[:q])
      @posts = @q.result(distinct: true).page(params[:page])
    end
  end
  
end