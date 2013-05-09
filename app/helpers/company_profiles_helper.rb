module CompanyProfilesHelper
	def get_vaciences(company_profile)
		@vacancies=company_profile.vacancies
	end
end
