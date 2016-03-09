class WelcomeController < ApplicationController
  def index
  	@posts = Post.all.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
  	@featured_post = @posts.find_by(:featured => true)
  end
end
