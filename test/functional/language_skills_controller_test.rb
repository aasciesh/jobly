require 'test_helper'
class LanguageSkillsControllerTest < ActionController::TestCase
include SessionHelper


    def setup
       login_as_job_seeker
    end 


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

  test "should  destroy language_skill" do 
    delete :destroy, id: @user_profile.language_skills.last.id
    assert_response :redirect
    assert_redirected_to @user_profile   
  end


  test "should get edit form" do
    get :edit, id: @language_skill.id
    assert_response :success
  end

  test "should update language_skill" do
    puts "*"*100
    puts language_skill_id=@language_skill.id
    puts "*"*100
    put :update, id: language_skill_id,
        language_skill: {
          name: 'Nepali',
          level: 1,
          skill_type: 'written'
        }
    assert_response :success
  end

end