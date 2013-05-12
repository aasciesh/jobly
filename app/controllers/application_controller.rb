class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionHelper
  include ApplicationHelper
  

	rescue_from CanCan::AccessDenied do |exception|
		# redirect_to root_path
		# flash[:error] = "Access denied."

	flash[:alert]= "Access Denied !! "+exception.message
    respond_to do |format|
            format.html {redirect_to root_path }
            format.js   {render 'shared/error'}
          end
  end
end
