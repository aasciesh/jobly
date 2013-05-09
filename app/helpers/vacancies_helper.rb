module VacanciesHelper
	def build_application
		@application=Application.new()
		@application.vacancy_id= @vacancy.id
		@application.user_profile_id= current_profile.id
		@application		
	end
	
	def get_applications(user_profile)
		@applications=user_profile.applications		
	end
end
