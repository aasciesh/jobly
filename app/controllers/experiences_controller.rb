class ExperiencesController < ApplicationController
before_filter :find_experience
load_and_authorize_resource

	def new
		@experience = Experience.new
		respond_to do |format|
			format.html
			format.js
		end
	end		

	def create
		@experience = current_profile.experiences.build(params[:experience])
		if @experience.save
			flash[:success] = "Experience created!"	
			respond_to do |format|
			format.html{
			flash[:success] = "Experience created!"	
			redirect_to user_profile_path(current_profile)
			}
			format.js
			end	

		else
			@error=@experience.errors
			respond_to do |format|
				format.html
				format.js {render 'shared/error'}
			end
		end
	end
		def destroy
    		@experience.destroy
    		redirect_to user_profile_path(current_profile)
    		flash[:success] = "Experience deleted succesfully!"	  
		end


  	private

	def find_experience
		@experience = Experience.find_by_id(params[:id])
	end

	def check_correct_user
		unless user_profile_includes?(@experience) 
			redirect_to user_profile_path(current_profile)
			flash[:error] = 'Couldnot delete'
		end
	end
end
