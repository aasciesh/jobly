require 'test_helper'
class LanguageSkillsControllerTest < ActionController::TestCase
include SessionHelper

<<<<<<< HEAD
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

      @language_skill = LanguageSkill.new(level: 5 ,
                                           name: 'Nepali',
                                            type: 'spoken')
    	@language_skill.save 
      @user.save
    	@user_profile.user = @user
      @user_profile.language_skills<<@language_skill
      @language_skill.save    
      @user_profile.save
      login_as(@user)
  end

  def login_as(user)
    @request.cookies[:remember_cookie] = user.remember_cookie
<<<<<<< HEAD
  end  
=======
  end
>>>>>>> experiences
=======
    def setup
       login_as_job_seeker
    end 
>>>>>>> ce7894569ed0fbd2eacc93b267b89b96b320cc74

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new language skill" do
    assert_difference "LanguageSkill.count", +1  do
      post :create, language_skill: { level: 5 ,
                                     name: 'Nepali', 
                                     skill_type: 'spoken'}
    end 

    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

<<<<<<< HEAD
<<<<<<< HEAD
# test "should get show" do
  #   get :show
  #   assert_response :success
  # end

=======
  test "should get destroy" do
    get :destroy
=======
  test "should  destroy language_skill" do
 
    delete :destroy, id: @language_skill.id
>>>>>>> ce7894569ed0fbd2eacc93b267b89b96b320cc74
    assert_response :redirect
    assert_redirected_to user_profile_path(@user_profile)
  end

  
<<<<<<< HEAD
>>>>>>> experiences
  # test "should get edit form" do
  #   get :edit
  #   assert_response :success
  # end
=======
  test "should get edit form" do
    get :edit, id: @language_skill.id
    assert_response :success
  end

  test "should update language_skill" do
    raise @language_skill.id
    put :update, id: @user_profile.language_skills.first.id,
        language_skill: {
          name: 'Nepali',
          level: 1,
          skill_type: 'written'
        }
    assert_response :success
  end
>>>>>>> ce7894569ed0fbd2eacc93b267b89b96b320cc74

 

<<<<<<< HEAD
  test "should get destroy" do
    get :destroy
    assert_response :success
    #assert_redirected_to user_profile_path(@user_profile)
  end
=======
>>>>>>> experiences

end