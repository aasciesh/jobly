class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include SessionHelper
  include ApplicationHelper


	rescue_from CanCan::AccessDenied do |exception|
		# redirect_to root_path
		# flash[:error] = "Access denied."

		respond_to do |format|
        format.html {
                      redirect_to root_path
                      @error= exception.message
                      }
        format.js   {render json: {status: 'failed', message: 'Access Denied !'}}
      end
	end
end
