ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

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
	                                      birth_date: '1990-03-28',
	                                      gender: 'Male',
	                                      full_address: 'testernenkatu, helsinki, finland',
	                                      street: 'testernenkatu',
	                                      city: 'helsinki',
	                                      country: 'finland',
	                                      zip: 00001,
	                                      self_info: 'I am a tester',
	                                      hobbies: 'I like testing' )

	    @user = User.new(email: "my@email.com",
	    				password: "mypassword",
	    				password_confirmation: "mypassword")

	    @language_skill = LanguageSkill.new(level: 5 ,
	                                        name: 'Nepali',
	                                        type: 'spoken')
	    @language_skill.save 
	    @user.save
	    @user_profile.user = @user
	    @user_profile.language_skills<<@language_skill
	    @language_skill.save    
	    @user_profile.save
	    login_as(@user)
	end

	def login_as_company
	     @company_profile = CompanyProfile.new(name: "company profile", 
		                      description: "company description",
		                      street: "annankatu 12",
		                      city: "helsinki",
		                      country: "finland",
		                      zip: "10201",
		                      website: "website.com",
		                      contact: "contact person" )

	    @user = User.new(email: "my@email.com",	password: "mypassword",
	    				password_confirmation: "mypassword")
  		@company_profile.user=@user
	   	@company_profile.save	    
	    login_as(@user)
	end


	def login_as(user)
	  @request.cookies[:remember_cookie] = user.remember_cookie
	  session[:user_id] = user.id 
	end
end
