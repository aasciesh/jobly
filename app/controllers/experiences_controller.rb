class ExperiencesController < ApplicationController
before_filter :find_experience
before_filter :check_correct_user, only: [:destroy]

	def new
		@experiences = Experience.new
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
			format.js{}
			end	

		else
			raise 'didnt save'
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
