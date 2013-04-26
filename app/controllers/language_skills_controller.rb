class LanguageSkillsController < ApplicationController
	def new
		@current_profile.language_skill = current_profile.LanguageSkill.new(name: 'english',
			level: '5',
			type: 'spoken')

		@current_profile.language_skill.build_user

		respond_to do |format|
			format.html
			format.js
		end		

		def create

			@language_skill = current_profile.language_skills.build(params[:language_skill])

			if @language_skill.save
				flash[:success] = "Language_Skill created!"				
			else

			end
		end

		def destroy
		end

		def edit
		end

		def update
		end


	end
end