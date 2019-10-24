class LikesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@post = Post.find(params[:post_id])
		like = current_user.likes.build(post_id: params[:post_id])
		like.save
		redirect_to request.referrer
	end

	def destroy
		@post = Post.find(params[:post_id])
		like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
		like.destroy
		redirect_to request.referrer
	end

end