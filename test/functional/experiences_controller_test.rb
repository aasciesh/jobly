require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
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
    	@experience = Experience.new(business_field: 'IT',
    								 start_date: '2008-05-09', 
    								 end_date: '2010-10-15', 
 									 position: 'Personal Assistant',
 									 responsibilities: 'Outbound customer calling to company standards 
 									 and targets with related supporting administrative tasks')

	 @experience.save 
    @user.save
    @user_profile.user = @user
    @user_profile.experiences<<@experience
    @experience.save    
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

  test "should create new experience" do
    
    assert_difference "Experience.count", +1  do
      post :create, experience: { business_field: 'IT',
    							start_date: '2008-05-09', 
    							end_date: '2010-10-15', 
 								position: 'Personal Assistant',
 								responsibilities: 'Outbound customer calling to company standards 
 								and targets with related supporting administrative tasks'}
    end
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should get destroy" do
    delete :destroy, id: experiences(:one).id
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)   

  end

end
