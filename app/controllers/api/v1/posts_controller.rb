class Api::V1::PostsController < ApplicationController
	respond_to :xml, :json

  def index
    @posts = Post.search(params[:id], params[:search])

    respond_with(@posts) do |format|
      format.xml
      format.json { render :json => @posts.as_json}
    end
  end
end