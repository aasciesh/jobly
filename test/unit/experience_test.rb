require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase

	test "Experiences should not save if full address is not present"do
	   experience = experiences(:one)
	   experience.full_address = ''
	   assert !experience.valid?
	   assert !experience.save 
	end

	test "Experiences should not save without employer info" do
		experience =experiences(:one)
		experience.employer=''
		assert !experience.valid?
		assert !experience.save
	end

	test "Experiences should not save without position info" do
		experience =experiences(:one)
		experience.position=''
		assert !experience.valid?
		assert !experience.save
	end

	test "Experiences should not save wihtout business field" do
		experience =experiences(:one)
		experience.business_field=''
		assert !experience.valid?
		assert !experience.save
	end

	test "Experiences should not save without responsibilities" do
		experience =experiences(:one)
		experience.responsibilities=''
		assert !experience.valid?
		assert !experience.save
	end

	test "Experiences should not save without start date" do
		experience =experiences(:one)
		experience.start_date=''
		assert !experience.valid?
		assert !experience.save
	end

	test "Experiences should not save without end date" do
		experience =experiences(:one)
		experience.end_date=''
		assert experience.valid?
		assert experience.save
	end
  
end
