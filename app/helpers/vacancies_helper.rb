module VacanciesHelper
	def get_applicants(vacancy)
		@applicants=vacancy.applications		
	end
	
	def get_applications(user_profile)
		@applications=user_profile.applications		
	end
end
