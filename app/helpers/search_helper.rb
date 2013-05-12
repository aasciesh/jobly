module SearchHelper
	def default_place
		if signed_in? && current_user.profile_type== "UserProfile"
			current_profile.city+', '+current_profile.zip.to_s+', '+current_profile.country
		else
			request.location.city+', '+request.location.postal_code+', '+request.location.country
		end
	end
end
