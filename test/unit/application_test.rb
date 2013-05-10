require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  test "should not save without user_profile_id present" do 
		application = applications(:one)
		application.vacancy_id = ""
		assert application.invalid?		
		assert !application.save
	end 	

	test "should not save without vacancy_id present" do 
		application = applications(:one)
		application.user_id = ""
		assert application.invalid?		
		assert !application.save
	end 

end
