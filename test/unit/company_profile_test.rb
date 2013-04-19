require (File.dirname(File.realdirpath(__FILE__)) + '/../test_helper.rb')


class CompanyProfileTest < ActiveSupport::TestCase
   	test "should not save without name present" do 
		company_profile = company_profiles(:one)
		company_profile.name = ""
		assert company_profile.invalid?
		assert !company_profile.name.nil?
		assert !company_profile.save
	end 	

	test "name length should not be more than 120 char" do 
		company_profile = company_profiles(:one)
		company_profile.name = "a"*3001
		assert company_profile.invalid?
		assert !company_profile.save
	end 

	test "name length should not be less than 3 char" do 
		company_profile = company_profiles(:one)
		company_profile.name = "a"*1
		assert company_profile.invalid?
		assert !company_profile.save
	end 

	test "should not save without description present" do 
		company_profile = company_profiles(:one)
		company_profile.description = ""
		assert company_profile.invalid?
		assert !company_profile.description.nil?
		assert !company_profile.save
	end 	

	test "description length should not be more than 3000 char" do 
		company_profile = company_profiles(:one)
		company_profile.description = "a"*3001
		assert company_profile.invalid?
		assert !company_profile.save
	end 

	test "description length should not be less than 15 char" do 
		company_profile = company_profiles(:one)
		company_profile.description = "a"*1
		assert company_profile.invalid?
		assert !company_profile.save
	end 
	test "contact length should not be more than 2000 char" do 
		company_profile = company_profiles(:one)
		company_profile.contact = "a"*2001
		assert company_profile.invalid?
		assert !company_profile.save
	end 
end
