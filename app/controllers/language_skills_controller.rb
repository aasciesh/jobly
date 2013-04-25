class LanguageSkillsController < ApplicationController
	def new
@current_profile.language_skill = CurrentProfile.LanguageSkill.new(name: 'english',
level: '5',
type: 'spoken')

@current_profile.language_skill.build_user

respond_to do |format|
format.html
format.js
end
end
