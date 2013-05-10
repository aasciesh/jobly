require 'test_helper'
class QualificationsControllerTest < ActionController::TestCase

  def setup 
    login_as_job_seeker     
  end 

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new qualification" do
    
    assert_difference "Qualification.count", +1  do
      post :create, qualification: {          
        degree_type: 'Bachelor In Business Information Technology', 
                          institute_name: 'Haaga-Helia UAS',
                          address: 'Pasila, Helsinki',                        
                          start: '2009-08-20'}
    end
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should  destroy qualification" do 
    delete :destroy, id: @user_profile.qualifications.first.id
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should get edit form" do
    get :edit, id: @user_profile.qualifications.first.id
    assert_response :success
  end

  test "should update qualification" do    
    put :update, id: @user_profile.qualifications.first.id,
         qualification: {
         degree_type: 'Bachelor In Business Information Technology', 
                          institute_name: 'Haaga-Helia UAS',
                          address: 'Pasila, Helsinki',                        
                          start: '2009-08-20'
        }
    assert_response :success
  end

end