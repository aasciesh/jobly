require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
include SessionHelper

  def setup
    login_as_job_seeker
  end 

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new experience" do
    
    assert_difference "Experience.count", +1  do
      post :create, experience: { business_field: 'IT 5 character',
                full_address: "merokatu timrosahar hamro desh",
    						start_date: '2008-05-09', 
                employer: 'mero oy',
 								position: 'Personal Assistant',
 								responsibilities: 'Outbound customer calling to company standards 
 								and targets with related supporting administrative tasks'}
    end
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should update experience" do    
    put :update, id: @user_profile.experiences.first.id,
         experience: {
         business_field: 'IT 5 character',
                full_address: "merokatu timrosahar hamro desh",
                start_date: '2008-05-09', 
                employer: 'mero oy',
                position: 'Personal Assistant',
                responsibilities: 'Outbound customer calling to company standards 
                and targets with related supporting administrative tasks'
        }
        assert_response :success
     end

  test "should get destroy" do
    delete :destroy, id: @experience.id
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end
  test "should get edit form" do
    get :edit, id: @experience.id
    assert_response :success
  end 
    
end
