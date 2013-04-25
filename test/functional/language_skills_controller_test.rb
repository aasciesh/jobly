require 'test_helper'

class LanguageSkillsControllerTest < ActionController::TestCase
  def setup
  	@current_user.language_skill = LanguageSkill.new(name : 'english',
  										level : '5',
  										type : 'spoken')

  	@current_user.language_skill.save
  	@current_user.language_skill	
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit form" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end



