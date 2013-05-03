require 'test_helper'

class LanguageSkillTest < ActiveSupport::TestCase
  
  test "Language Skills should not save if name is not present" do
  		language_skill = language_skills(:one)	
    	language_skill.name = ""
    	language_skill.level = "5"
    	language_skill.type = "spoken"    	
    	assert language_skill.invalid?
    	assert !language_skill.save
	end
	test "Should not save if language skills type is not present"do
		language_skill = language_skills(:one)
		language_skill.type = ""
		assert language_skill.invalid?
		assert !language_skill.save
	end
	test "Should not save if level is not present"do
		language_skill = language_skills(:one)
		language_skill.level = ""
		assert language_skill.invalid?
		assert !language_skill.save
	end
	test "language_skill type must be spoken or written" do
    	language_skill = language_skills(:one)
    	language_skill.name = "Finnish"
    	language_skill.level = "4"
    	language_skill.type = "reading"
    	assert language_skill.invalid?
    	assert !language_skill.save
	end
	test "language_skill Skill level must be from 0 to 5"do
		language_skill = language_skills(:one)
		language_skill.level = "6"
		assert language_skill.invalid?
		assert !language_skill.save
	end
end




