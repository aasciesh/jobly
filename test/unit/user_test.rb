require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should save only with valid params" do 
  		user = User.new 	
    	user.email = "a@xyz.com"
    	user.password = "password"
    	user.type ="u"
    	user.password_confirmation = "password"
    	assert user.valid?, "#{user.errors.messages}"
    	assert user.save
  end

  test "Should not save without Email" do
  		user = User.new 		
    	user.password = "mypassword"
    	user.password_confirmation = "mypassword"
    	user.email = ""
    	assert user.invalid?
    	assert !user.save
	end 

	test "Invalid Email should not be saved" do 
		user = User.new		
    	user.password = "mypassword"
    	user.password_confirmation = "mypassword"
    	user.email = "example.com"
    	assert user.invalid?
    	assert !user.save
	end 

	test "Should not save without Password" do 
		user = User.new
		user.password = ""    	
    	user.email = "a@xyz.com"
    	assert user.invalid?
    	assert !user.save
	end 	

	test "Email should be unique in user table" do 
		user = User.new(email: "a@sigdel.com", 
                    password: "mypassword", 
                    password_confirmation: "mypassword")
    	user.save

    	user2 = User.new(email: user.email, 
                     password: "mypassword", 
                     password_confirmation: "mypassword")
    	assert user2.invalid?
    	assert !user2.save
	end 

	
	test "Password and Password confirmation should be made" do 
		user = User.new
		user.password = "mypassword"
		user.email = "a@sigdel.com"
		assert user.invalid?
		assert !user.save
	end 

	 test "user password should not be less than 8 characters" do
	 	user = User.new
		user.password = "1234567"
		user.password_confirmation = "1234567"
		user.email = "a@sigdel.com"
		assert user.invalid?
		assert !user.save

	 end

	 test "user password should not be more than 20 characters" do
	 	user = User.new
		user.password = "123456789012345678901"
		user.password_confirmation = "123456789012345678901"
		user.email = "a@sigdel.com"
		assert user.invalid?
		assert !user.save

	 end
	 

    test "User type must be c or u" do
    	user = User.new
		user.password = "mypassword"
		user.password_confirmation = "mypassword"
		user.email = "a@sigdel.com"
		user.type = "c"
		assert user.valid?
		assert user.save
	end

end