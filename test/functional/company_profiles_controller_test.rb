require 'test_helper'

class CompanyProfilesControllerTest < ActionController::TestCase
	def build_company
		  @company_profile = CompanyProfile.new(name: "company profile", 
		                      description: "company description",
		                      street: "annankatu 12",
		                      city: "helsinki",
		                      country: "finland",
		                      zip: "10201",
		                      website: "website.com",
		                      contact: "contact person" )

	    @user= User.new(email:'testeremail@testernen.com', password: 'abcdef123', password_confirmation: 'abcdef123' )	  
	    @company_profile.user=@user
	    @company_profile		
	end
	
	test "should get new form for company with user model" do
		get :new
		assert_response :success
		# user=params[:company_profile].user
		# assert user=User.new
	end

	test "should get company index" do 
		get :index
		assert_response :success
	end

	test "should create company profile" do	
		assert_difference "CompanyProfile.count", +1, "This is failing" do			
			post :create, company_profile: {name: "Company name", 
		                      description: "company description",
		                      street: "annankatu 12",
		                      city: "helsinki",
		                      country: "finland",
		                      zip: "10201",
		                      website: "website.com",
		                      contact: "contact person" }
		end
		assert_template :show, "FAILED"
		assert_equal "Company name has been registered.", flash.now[:success], "FAILED"  
	end

# TODO: Functional test to assert error message for company profile
	test "should flash error message with invalid params" do
		assert_no_difference("CompanyProfile.count") do
			post :create, company_profile: {name: " ", 
		                      description: "company description",
		                      street: "annankatu 12",
		                      city: "helsinki",
		                      country: "finland",
		                      zip: "10201",
		                      website: "website.com",
		                      contact: "contact person" }
			end
		assert_template :new, "FAILED"		
		assert_equal response.errors, flash.now[:errors], "FAILED"  
	end

	test "should build user for company profile" do
		
		company_profile = CompanyProfile.new
		assert company_profile.build_user
		assert_response :success
	end

	test "should show company profile" do
		get :show, id: company_profiles(:one).id
		assert_response :success
	end

	test "should get edit form" do
		get :edit, id: company_profiles(:one)
		assert_response :success
	end

	test "should update company information" do
		company_profile = CompanyProfile.new
		company_profile.name= "company" 
		company_profile.description= "company description"
		company_profile.street= "annankatu 12"
		company_profile.city= "helsinki"
		company_profile.country= "finland"
		company_profile.zip= "10201"
		company_profile.website= "website.com"
		company_profile.contact= "contact person"
		company_profile.save
		put :update, id: company_profile.id,
			company_profile: { 
				name: "company", 
				description: "company description",
				street: "annankatu 12",
				city: "helsinki",
				country: "finland",
				zip: "10201",
				website: "website.com",
				contact: "contact person" }
		
		assert_template :show, "FAILED"
		assert_equal "Successfully updated profile.", flash.now[:notice]
	end

end
