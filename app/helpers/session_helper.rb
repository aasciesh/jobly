module SessionHelper
	def sign_in(user)
		cookies[:remember_cookie]=user.remember_cookie
		current_user= user
		current_profile = user.profile
	end

	def current_user=(user)
	 @current_user = user
	end

	def current_profile=(profile)
		@current_profile= profile
	end

	def current_profile
		@current_profile || 
		(CompanyProfile.find_by_id(current_user.profile_id) if current_user.type== 'c')|| 
		(UserProfile.find_by_id(current_user.profile_id]) if current_user.type== 'u')
	end

	def current_user
		@current_user ||= User.find_by_remember_cookie(cookies[:remember_cookie])
	end
	
	def guest?
		current_user.nil?
	end
	
	def signed_in?
	    !current_user.nil?
	end

	def sign_out 
		cookies.delete :remember_cookie
		current_user = nil
		current_profile = nil

	end

	def store_request_path
	    session[:return_to] = request.fullpath
	end


	def redirect_back_or(default)
	    redirect_to(session[:return_to] || default)
	    session.delete(:return_to)
	end

	def signed_in_user
		unless signed_in?
			store_request_path
			redirect_to root_path
		end	
	end
end
