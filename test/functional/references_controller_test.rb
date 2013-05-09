require 'test_helper'
class ReferencesControllerTest < ActionController::TestCase
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
      	
        @reference = Reference.new(referee_name: 'Jack', email: 'jack@email.com')

    	  @reference.save 
      	@user.save
    	  @user_profile.user = @user
      	@user_profile.references<<@reference
      	@reference.save    
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

  test "should create new reference" do
    
    assert_difference "Reference.count", +1  do
      post :create, reference: { referee_name: 'Jack', email: 'jack@email.com'}
    end
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  test "should get destroy" do
    get :destroy
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