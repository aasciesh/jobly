require 'test_helper'

class ReferenceTest < ActiveSupport::TestCase
  test "should save only with valid params" do 
  		reference = references(:one) 	
    	reference.email = "a@xyz.com"    	
    	reference.referee_name ="Prakash Sigdel"    	
    	assert reference.valid? 
    	assert reference.save
  end
  test "should save only if referee_name is present" do 
  		reference = references(:one) 	
    	reference.email = "a@xyz.com"    	
    	reference.referee_name =""    	
    	assert !reference.referee_name.nil? 
    	assert !reference.save
  end
  test "should save only if referee_email is present" do 
  		reference = references(:one)	
    	reference.email = ""   	
    	reference.referee_name ="Prakash Sigdel"    	
    	assert !reference.email.nil?
    	assert !reference.save
   end

end
