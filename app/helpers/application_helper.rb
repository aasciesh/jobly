module ApplicationHelper
	def set_title(page_title)
		if !page_title.blank?
			page_title
		else
			base_title= 'Jobly'
		end
	end	

	def build_company_profile
		@company_profile=CompanyProfile.new
    	@company_profile.build_user
    	@company_profile

	end
	def build_user_profile
		@user_profile=UserProfile.new
    	@user_profile.build_user
    	@user_profile	
	end
end
