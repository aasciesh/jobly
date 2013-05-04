require 'test_helper'


class UserProfileTest < ActiveSupport::TestCase
  
  test "should not save without firstname and lastname" do
    userprofile=user_profiles(:one)
    userprofile=user_profiles(:one)
        # userprofile=UserProfile.new
        # userprofile=UserProfile.new
    userprofile.lastname=""
    userprofile.firstname=""
    assert !userprofile.valid?
    assert !userprofile.save
    #	 assert_not_equal(1, 2)
  end

  test "should not save until full adress is given" do
    userprofile=user_profiles(:one)
    userprofile.full_address=''
    assert !userprofile.valid?
    assert !userprofile.save
 end

 test "should not save if user's age is less than 16 years" do
    userprofile=  user_profiles(:one)
    userprofile.birth_date= DateTime.now-2.years 
    puts userprofile.birth_date
    assert userprofile.invalid?
    assert !userprofile.save
 end
end
