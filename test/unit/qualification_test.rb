require 'test_helper'

class QualificationTest < ActiveSupport::TestCase
  test "qualifications should not save if institue_name is not present" do
  		qualification = qualifications(:one)
  		qualification.degree_type = "Bachelor in Business"
    	qualification.institute_name = ""    	   	
    	assert qualification.invalid?
    	assert !qualification.save
	end
	test "Should not save if degree_type is not present" do
		qualification = qualifications(:one)
		qualification.degree_type = ""
		assert qualification.invalid?
		assert !qualification.save
	end
	test "Should not save if address is not present" do
		qualification = qualifications(:one)
		qualification.address = ""
		assert qualification.invalid?
		assert !qualification.save
	end
	
end
