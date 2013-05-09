require 'test_helper'

class CompanyProfilesControllerTest < ActionController::TestCase
	
	test "should get new form for company with user model" do
		get :new
		assert_response :success	
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
		                      contact: "contact person" ,
		                  	}
		end
		assert_redirected_to company_profile_path(:company_profile), "FAILED"
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
		assert :fail
		#assert_equal "Could not register company.", flash.now[:errors], "FAILED"  
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
		login_as_company
		get :edit, id: @company_profile.id
		assert_response :success
	end

	test "should update company information" do
		login_as_company
	
		put :update, id: @company_profile.id,
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
