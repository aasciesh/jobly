require 'test_helper'

class EmailConfirmationTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
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
    @user= User.new(email: 'getaasciesh@hotmail.com', password: '12345abd', password_confirmation: '12345abd')
    @user.save
    @user_profile.save
    @user.profile = @user_profile

  end


  test "confirmation" do
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do

      EmailConfirmation.confirm_email(@user).deliver
    end
    confirm_email = ActionMailer::Base.deliveries.last
 
    assert_equal "Welcome to Jobly", confirm_email.subject
    assert_equal @user.email, confirm_email.to[0]
    assert_match(/Please click link below or copy paste it to browser for activation/, confirm_email.body)
  end
end
