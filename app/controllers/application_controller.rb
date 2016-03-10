class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::UnknownFormat, with: :not_found

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end
    head status: status and return if errors.empty?

    render json: errors.to_json, status: status
  end

  def not_found
    return api_error(status: 404, errors: 'Not found')
  end

  # Workaround for routing error 
  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render :file => 'public/404.html', :status => :not_found, :layout => true
  end

  # Helpers
  helper_method :current_user, :logged_in?, :require_user

  def current_user
  	@user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	if !logged_in?
  		flash[:danger] = 'You must be logged in to perform this action!'
  		redirect_to root_path
  	end
  end
end
