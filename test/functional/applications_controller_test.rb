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
		
		put :update, id: @application.id,
			application: {
			user_id: 1,			
			vacancy_id: @vacancy.id,
			bookmark: true
			}				 
		assert_redirected_to vacancy_path(@vacancy), "FAILED"
		assert_equal "Successfully bookmarked applicant.", flash.now[:success]
	end


end
