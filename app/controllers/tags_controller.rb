class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.paginate(page: params[:page])
  end

end