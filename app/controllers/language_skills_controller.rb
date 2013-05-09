class LanguageSkillsController < ApplicationController		
	
before_filter :find_language_skill
#before_filter :check_correct_user, only: [:destroy]

	def new
		@language_skills = LanguageSkill.new
	end		

	def create
		@language_skill = current_profile.language_skills.build(params[:language_skill])
		if @language_skill.save
			flash[:success] = "Language_Skill created!"	
			respond_to do |format|
				format.html{
				flash[:success] = "Language_Skill created!"	
				redirect_to user_profile_path(current_profile)
				}
				format.js{}
			end	

		else
			raise 'didnt save'
		end
	end

	def destroy
		@language_skill.destroy
		redirect_to user_profile_path(current_profile)
		flash[:success] = "Language_Skill deleted succesfully!"	  
	end


  	private

	def find_language_skill
		@language_skill = LanguageSkill.find_by_id(params[:id])
	end

	def check_correct_user
		unless user_profile_includes?(@language_skill) 
			redirect_to user_profile_path(current_profile)
			flash[:error] = 'Couldnot delete'
		end
	end
	
end
