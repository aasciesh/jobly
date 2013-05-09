require 'test_helper'
class LanguageSkillsControllerTest < ActionController::TestCase
include SessionHelper

    def setup
       login_as_job_seeker
    end 

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new language skill" do
    assert_difference "LanguageSkill.count", +1  do
      post :create, language_skill: { level: 5 ,
                                     name: 'Nepali', 
                                     type: 'spoken'}
    end 

    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should get destroy" do
    delete :destroy, id: language_skills(:one).id
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  
  # test "should get edit form" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end


end