require 'test_helper'
class ReferencesControllerTest < ActionController::TestCase


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
    delete :destroy, id: @user_profile.references.first
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should update reference" do    
    put :update, id: @reference.id,
         reference: {
                      referee_name: 'Jack',
                      email: 'jack@email.com'
        }
        assert_redirected_to user_profile_path(@reference.user_profile)
  end

  test "should get edit form" do
    get :edit, id: @reference.id
  assert_response :success
  end 

end