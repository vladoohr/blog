class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	respond_to :html, :json

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			render json: @user.as_json, status: :ok
		else
			render json: {user: @user.errors, status: :no_content}
		end
	end

	private 
		def user_params
			params.fetch(:user, {}).permit(:name, :email, :password)
		end
end