require 'test_helper'

class CompanyProfilesControllerTest < ActionController::TestCase
	test "should get new form for company" do
	get :new
		assert_response :success
	end

	test "should get company index" do 
	get :index
	assert_response :success
	end

	test "should create company profile" do
	assert_difference "CompanyProfile.count", +1, "This is failing" do
		post :create, company_profile: {name: "company", 
	                      type: "mytype", 
	                      description: "company description",
	                      street: "annankatu 12",
	                      city: "helsinki",
	                      country: "finland",
	                      zip: "10201",
	                      website: "website.com",
	                      contact: "contact person" }
	end
	assert_redirected_to company_profiles_path, "FAILED"
	assert_equal "Welcome to Jobly!", flash.now[:success], "FAILED"  
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
		assert_response :redirect
		assert_redirected_to company_profile_path
		assert_equal "Information updated successfully!", flash.now[:success]
	end

end
