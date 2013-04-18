require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  	include SessionHelper
   
   def setup 
    @user = User.new(email: "user@example.com",
                     password: "abcded12",
                     password_confirmation: "abcded12")

    @user.save
    @user
  end

  def login_as(user)
    @request.session[:remember_cookie] = user ? user.remember_cookie : nil
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'h1', 'Sign In'
  end

  test "should write a session when a user logged in" do
    post :create, session: {email: @user.email, password: @user.password}
    assert_response :redirect
    assert cookies[:remember_cookie].present?
    assert_equal "You are logged in now.", flash[:notice]
  end

  test "should delete session" do
    login_as(@user)
    delete :destroy, id: @user.id
    assert cookies[:remember_cookie].nil?
    assert_response :redirect
    assert_redirected_to root_url
    assert_equal "Thank you for using Jobly. See you soon", flash[:notice]
  end
end
