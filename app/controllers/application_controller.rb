class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  http_basic_authenticate_with name: 'tokyosmith', password: 'champion'
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) 
    user_videos_path(resource)
  end

  protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :corporation, :owner, :email, :password, :password_confirmation) }
	end

end