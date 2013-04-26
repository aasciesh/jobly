require 'test_helper'

class UserProfilesControllerTest < ActionController::TestCase
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
    @user= User.new(email:'tester@testernen.com', password: 'abcdef123', password_confirmation: 'abcdef123' )
    @user.save
    @user_profile.user=@user
    @user_profile.save
    @user_profile
  end

  test "should get index page" do
    get :index
    assert_response :success
  end

  test "should show the right user profile" do
    get :show, id: @user_profile.id
    assert_select 'title', @user_profile.firstname+' '+@user_profile.lastname
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'title', 'Jobly | Job seeker Sign up'
  end

  test "should create user profile" do
    assert_difference "UserProfile.count", +1  do
      post :create, user_profile: { firstname: 'tester',
                                    lastname: 'testernen',
                                    birth_date: '1990-03-28',
                                    gender: 'm',
                                    full_address: 'testernenkatu, helsinki, finland',
                                    street: 'testernenkatu',
                                    city: 'helsinki',
                                    country: 'finland',
                                    zip: 00001,
                                    self_info: 'I am a tester',
                                    hobbies: 'I like testing'
                                  }
    end

    assert_response :success
    assert_equal 'tester testernen, your profile has been created.', flash[:success]
  end

  test "should get edit page" do
    get :edit, id: @user_profile.id
    assert_response :success
    assert_select 'title', @user_profile.firstname+ ' '+@user_profile.lastname+' | Edit Proifle'
  end

  test "user profile should get updated" do
    put :update, id: @user_profile.id, user_profile: {
                                    gender: 'm',
                                    full_address: 'testernenkatu, helsinki, finland',
                                    street: 'gandgandkatu',
                                    city: 'Tampere',
                                    country: 'Finland',
                                    zip: 00001,
                                    self_info: 'I am a tester',
                                    hobbies: 'I like testing and eating food' }
    
    assert_response :success
    assert_equal 'Successfully updated profile.', flash[:notice]
  end

 
  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
