class PostsController < ApplicationController
	before_action :require_user, only: [:new, :create]
	skip_before_action :verify_authenticity_token
	respond_to :html, :json

	def new
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			render json: @post.as_json, status: :ok
		else
			render json: {post: @post.errors, status: :no_content}
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to :back
		flash[:success ] = "Post is deleted!"
	end

	private
		def post_params
			params.fetch(:post, {}).permit(:title, :description, :username)
		end

end