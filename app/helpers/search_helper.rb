module SearchHelper
	def default_place
		if signed_in? && current_user.profile_type== "UserProfile"
			current_profile.city+', '+proper_zip(current_profile.zip)
		elsif request.remote_ip== '127.0.0.1'
			''
		else
			request.location.city+', '+proper_zip(request.location.postal_code)
		end
	end
	private
	def proper_zip(feed)
		if feed.present?
	 		return	"%.5i" %feed
	 	else
	 		feed
	 	end
	end
end
