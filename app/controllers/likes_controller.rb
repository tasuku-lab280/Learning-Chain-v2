class LikesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@like = current_user.likes.create(post_id: params[:post_id])
		@post = Post.find(params[:post_id])
		render 'create.js.erb'
	end

	def destroy
		@like = current_user.likes.find_by(post_id: params[:id].to_i).destroy
    @post = Post.find(params[:id])
    render 'destroy.js.erb'
	end

end