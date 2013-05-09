require 'test_helper'

class ApplicationsControllerTest < ActionController::TestCase
  
	include CanCan::Ability
	test "should get applications new form" do 
		login_as_job_seeker		
		get :new
		assert_response :success
	end

	test "should create application" do
		login_as_job_seeker	
		assert_difference "Application.count", +1, "This is failing" do
			post :create, application: {user_id: @user.id,
								  vacancy_id: 1 }
			end
		assert_redirected_to vacancy_path(1), "FAILED"
		assert_equal "Your application has been sent !!", flash.now[:success], "FAILED"  
	end



	test "should update Application " do
		login_as_company
		vacancy=Vacancy.new
		vacancy.title="MyString"
		vacancy.description="MyText hmm hmm"
		vacancy.deadline="2013-03-28 21:12:35"
		vacancy.job_type="full-time"
		vacancy.job_address="MyString"
		vacancy.street="MyString"
		vacancy.city="MyString"
		vacancy.country="MyString"
		vacancy.zip="1"
		vacancy.latitude="1.5"
		vacancy.longitude="1.5"
		vacancy.min_salary="2000"
		vacancy.max_salary="20000"
		vacancy.job_duration="lt3"
		vacancy.company_profile=@company_profile
		r=vacancy.save
raise r	
		application = Application.new
		application.user_id= 1
		application.vacancy_id=vacancy.id	
		
		application.bookmark=false				
		application.save
		
		put :update, id: application.id,
			application: {
			user_id: 1,			
			vacancy_id: 1,
			bookmark: true
			}
				 
		assert_redirected_to vacancy_path(1), "FAILED"
		assert_equal "Successfully bookmarked applicant", flash.now[:success]
	end
end
