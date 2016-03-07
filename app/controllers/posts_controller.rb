class PostsController < ApplicationController
	skip_before_action :verify_authenticity_token
	respond_to :html, :json

	def create
		@post = Post.new(post_params)
		if @post.save
			render json: @post.as_json, status: :ok
		else
			render json: {post: @post.errors, status: :no_content}
		end
	end

	def destroy
	end

	private
		def post_params
			params.fetch(:post, {}).permit(:title, :description, :username)
		end

end