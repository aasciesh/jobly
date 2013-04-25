class LanguageSkillsController < ApplicationController
	
	def new
    @user_profile.language_skill = UserProfile.LanguageSkill.new(name: 'english',
  										level: '5',
  										type: 'spoken')

    @user_profile.language_skill.build_user

    respond_to do |format|
      format.html 
      format.js
    end

    
end
