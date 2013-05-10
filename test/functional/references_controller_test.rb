require 'test_helper'
class ReferencesControllerTest < ActionController::TestCase
include SessionHelper

  def setup 
    login_as_job_seeker     
  end 

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new reference" do
    
    assert_difference "Reference.count", +1  do
      post :create, reference: { referee_name: 'Jack',
                                 email: 'jack@email.com'}
    end
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should get destroy" do
    delete :destroy, id: references(:one).id
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should update reference" do    
    put :update, id: @user_profile.references.first.id,
         reference: {
                      referee_name: 'Jack',
                      email: 'jack@email.com'
        }
        assert_response :success
     end

    test "should get edit form" do
    get :edit, id: @reference.id
    assert_response :success
  end 



end