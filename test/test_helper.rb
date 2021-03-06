ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
include SessionHelper
include CanCan::Ability

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
	def login_as_job_seeker
	    @user_profile = UserProfile.new(firstname: 'tester',
	                                      lastname: 'testernen',
	                                      user_name: 'user_name1',
	                                      birth_date: '1990-03-28',
	                                      gender: 'Male',
	                                      full_address: 'testernenkatu, helsinki, finland',
	                                      street: 'testernenkatu',
	                                      city: 'helsinki',
	                                      country: 'finland',
	                                      zip: 00001,
	                                      self_info: 'I am a tester',
	                                      hobbies: 'I like testing' )

	    @user = User.new(email: "job_seeker@email.com",
	    				password: "mypassword",
	    				password_confirmation: "mypassword")
	    
	    
	    @user.save
	    @user_profile.user = @user

	    @language_skill=build_language_skill
	    @language_skill.save  
	    @user_profile.language_skills<<@language_skill

	    @experience=build_experience
	    @experience.save
	    @user_profile.experiences<<@experience

	    @qualification=build_qualification
	    @qualification.save	 	   
	    @user_profile.qualifications<<@qualification	

	    @reference=build_reference
	    @reference.save	 	   
	    @user_profile.references<<@reference    
	  
	    @user_profile.save
	    login_as(@user)    
	end

	def login_as_company
	    @company_profile = build_company_profile
	    @user = User.new(email: "company@email.com",	password: "mypassword",
	    				password_confirmation: "mypassword")
	   
	    @vacancy=build_vacancy
	    @vacancy.company_profile=@company_profile
	    @vacancy.save
	    @application=Application.new(user_id: 1, vacancy_id: @vacancy.id)
	    @application.save
  		@company_profile.user=@user
  		@user.save
	   	@company_profile.save	    
	    login_as(@user)
	end
	
	def build_company_profile
	  @company_profile = CompanyProfile.new(name: "company profile", 
		                      description: "company description",
		                      street: "annankatu 12",
		                      city: "helsinki",
		                      country: "finland",
		                      zip: "10201",
		                      website: "website.com",
		                      contact: "contact person" )
	end
	def build_vacancy
		@vacancy=Vacancy.new(	title: "MyString",
								  description: "10 characters for description",
								  deadline: '2013-05-28 21:12:35',
								  job_type: "full-time",
								  job_address: "MyString",
								  street: "MyString",
								  city: "MyString",
								  country: "MyString",
								  zip: 12345,
								  latitude: '1.5',
								  longitude: '1.5',
								  min_salary: 2000,
								  max_salary: 20000,
								  job_duration: "3to12"  ) 		
	end

	def build_qualification
		@qualification = Qualification.new(degree_type: 'Bachelor In Business Information Technology', 
        									institute_name: 'Haaga-Helia UAS',
        									address: 'Pasila, Helsinki',        								
        									start: '2009-08-20'
        								)

	end

	def build_language_skill
	@language_skill = LanguageSkill.new(level: 5 ,
	                                        name: 'Nepali',
	                                        skill_type: 'spoken')
	
		
	end

	def build_experience
	 	@experience = Experience.new(business_field: 'IT 5 character',
                				full_address: "merokatu timrosahar hamro desh",
    							start_date: '2008-05-09', 
                				employer: 'mero oy',
 								position: 'Personal Assistant',
 								responsibilities: 'Outbound customer calling to company standards 
 								and targets with related supporting administrative tasks')
	end

	def build_reference
		@reference = Reference.new(referee_name: 'Jack',
                      email: 'jack@email.com')
		
	end
	def login_as(user)
	  @request.cookies[:remember_cookie] = user.remember_cookie
	  session[:user_id] = user.id 
	end
end
