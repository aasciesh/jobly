require 'test_helper'

class LanguageSkillsControllerTest < ActionController::TestCase
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

  	@user.save
  	@user_profile.user = @user
    @user_profile.save
  end

def login_as(user)
  @request.session[:remember_cookie] = user.remember_cookie
end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create
    assert_response :success
  end

  # test "should get edit form" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end