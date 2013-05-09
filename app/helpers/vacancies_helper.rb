module VacanciesHelper	
	def get_vacancies(company_profile)
		@vacancies=company_profile.vacancies
	end
end
