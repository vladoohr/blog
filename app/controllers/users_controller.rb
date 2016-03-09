class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	
		if @user.save
			flash[:success] = 'Успешно се регистриравте!'
			session[:user_id] = @user.id
			redirect_to root_path # change to articles
		else
			render :new
		end
	end

	def posts
		@posts = current_user.posts.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
	end
	
	def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end