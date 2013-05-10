require 'test_helper'
class QualificationsControllerTest < ActionController::TestCase
include SessionHelper

  def setup
      @user_profile = UserProfile.new(firstname: 'tester',
                                      lastname: 'testernen',
                                      birth_date: '1990-03-28',
                                      gender: 'm',
                                      full_address: 'testernenkatu, helsinki, finland',
                                      street: 'testernenkatu',
                                      city: 'helsinki',
                                      country: 'finland',
                                      zip: 00001,
                                      self_info: 'I am a tester',
                                      hobbies: 'I like testing' )

    	@user = User.new(email: "my@email.com",
    										password: "mypassword",
    										password_confirmation: "mypassword")
      	
        @qualification = Qualification.new(degree_type: 'Bachelor In Business Information Technology', 
        									institute_name: 'Haaga-Helia UAS')

    	@qualification.save 
      @user.save
    	@user_profile.user = @user
      @user_profile.qualifications<<@qualification
      @qualification.save    
      @user_profile.save
      login_as(@user)
  end

  def login_as(user)
    @request.cookies[:remember_cookie] = user.remember_cookie
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new qualification" do
    
    assert_difference "Qualification.count", +1  do
      post :create, reference: { degree_type: 'Bachelor In Business Information Technology', 
        						institute_name: 'Haaga-Helia UAS'}
    end
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should get destroy" do
    delete :destroy, id: @qualification.id
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end
  
  test "should get edit form" do
    get :edit, id: @qualification.id
    assert_response :success
  end

  test "should get update" do
    raise @qualification.id
    put :update, id: @user_profile.qualifications.first.id,
    qualification: {degree_type: 'Bachelor In Business Information Technology', 
                          institute_name: 'Haaga-Helia UAS'}
    assert_response :success
  end

  
end