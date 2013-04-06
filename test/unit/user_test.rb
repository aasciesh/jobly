require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should save only with valid params" do 
  		user = User.new 	
    	user.email = "a@xyz.com"
    	user.password = "mypassword"
    	user.type ="u"
    	user.password_confirmation = "mypassword"
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

	 test "user password must be between 8 and 20 characters" do
    	user = User.new(:email => "a@sigdel.com")
    	
       	user.password = "123"    	
    	assert user.invalid?
    	assert !user.save

    	user.password = ""    	
    	assert user.invalid?
    	assert !user.save

    	#8 characters.
    	user.password = "password"
    	user.password_confirmation = "password"
   	    assert user.valid?
   	    assert !user.save

        #20 characters.
    	user.password = "12345678901234567890"
    	user.password_confirmation = "12345678901234567890"
    	assert user.valid?
    	assert !user.save

    	#21 characters.
    	user.password = "123456789012345678901"    	
    	assert user.invalid?
    	assert !user.save
    end	
    test "User type must be c or u" do
    	user = User.new
		user.password = "mypassword"
		user.email = "a@sigdel.com"
		user.user_type = "u"
		assert user.valid?
		assert !user.save
	end

end