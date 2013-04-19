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


   test "should not save until gender is given" do
   	 userprofile=user_profiles(:one)
   	 userprofile.gender=''
   	 assert !userprofile.valid?
   	 assert !userprofile.save
   end

  # # test "should not save until street is given" do

  # # end

  # # test "should not save until city is given" do

  # # end
  # def setup

  # end

    test "should not save until full adress is given" do
      userprofile=user_profiles(:one)
      userprofile.full_address=''
      assert !userprofile.valid?
      assert !userprofile.save
   end

   test "should not save until country is given" do
      userprofile=user_profiles(:one)
      userprofile.country=''
      assert !userprofile.valid?
      assert !userprofile.save
   end

  # test "should not save until self_info is given" do
  # userprofile=user_profiles(:one)
  # userprofile.self_info="Write something about u"
  # assert !userprofile.save
 
  # end

  # test "should not save until zip is given" do
# userprofile=user_profiles(:one)
  # userprofile.zip=''
  # assert userprofile.invalid?
  # assert !userprofile.save
  #  end

  test "should not save until birth_date is given" do
      userprofile=  user_profiles(:one)
      userprofile.birth_date='' 
      puts 'true TRUE true' if !userprofile.nil?
      puts userprofile.birth_date
      assert userprofile.invalid?
      assert !userprofile.save
   end

   test "should not save if user's age is less than 16 years" do
      userprofile=  user_profiles(:one)
      userprofile.birth_date= DateTime.now-2.years 
      puts userprofile.birth_date
      assert userprofile.invalid?
      assert !userprofile.save
   end

  # test "should not save until hobby is given" do
  # userprofile=user_profiles(:one)
  # userprofile.hobbies="roaming, going to cruise"
  # assert !userprofile.save
  #  end

  # test "should not save until fulladdress is given" do
# userprofile=user_profiles(:one)
  # userprofile.full_address="Give some full address"
  # assert !userprofile.save
  # end

  # test "should not save until avatar is given" do

  # end
  # test "the truth" do
  #   assert true
  # end

end
