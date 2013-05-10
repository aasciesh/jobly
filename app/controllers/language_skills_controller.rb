class LanguageSkillsController < ApplicationController
before_filter :find_language_skill
load_and_authorize_resource

	def new
		@language_skill = LanguageSkill.new
		respond_to do |format|
			format.html
			format.js
		end
	end		

	def create
		@language_skill = current_profile.language_skills.build(params[:language_skill])
		if @language_skill.save
			flash[:success] = "language_skill created!"	
			respond_to do |format|
			format.html{
			redirect_to user_profile_path(current_profile)
			}
			format.js
			end	

		else
			@error=@language_skill.errors
			respond_to do |format|
				format.html
				format.js {render 'shared/error'}
			end
		end
	end

	def edit
		respond_to do |format|
				format.html
				format.js 
			end
	end

	def update
		
		if @language_skill.update_attributes(params[:language_skill])
			respond_to do |format|
			format.html{
				flash[:success] = "language_skill updated!"	
				redirect_to user_profile_path(current_profile)
			}
			format.js
			end	

		else
			@error=@language_skill.errors
			respond_to do |format|
				format.html
				format.js {render 'shared/error'}
			end
		end
	end

	def destroy
		if @language_skill.destroy
			respond_to do |format|
				format.html{flash[:success] = "language_skill deleted succesfully!"	
				redirect_to user_profile_path(current_profile)
				}
				format.js 
			end
		else
			format.html{flash[:error] = "Could not delete"	
				redirect_to user_profile_path(current_profile)
				}
				format.js {render 'shared/error'}
		end
	end


  	private

	def find_language_skill
		@language_skill = LanguageSkill.find_by_id(params[:id])
	end

	
end
