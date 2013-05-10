class LanguageSkillsController < ApplicationController		
	load_and_authorize_resource
	before_filter :find_language_skill
	
	def new	
	end	

	def edit
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

	def update
		@language_skill=LanguageSkill.find(params[:id])
		if @language_skill.update_attributes(params[:language_skill])	 	 
			redirect_to cv_path(@language_skill.user_profile)
	      	respond_to do |format|
		        format.html {		                   
		                    flash.now[:success]= "Successfully updated language_skill."
		                  
		                    }
		        format.js {render json: {status: 'success', message: 'Successfully updated language_skill.'}}
	    	end
    	else
	      	@error= @language_skill.errors
      		
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
end
