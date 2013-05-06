class QualificationsController < ApplicationController

	before_filter :find_qualification
	before_filter :check_correct_user, only: [:destroy]

	def new
			@qualifications = Qualification.new
		end		

		def create
			@qualification = current_profile.qualifications.build(params[:qualification])
			if @qualification.save
				flash[:success] = "Qualification created!"	
				respond_to do |format|
					format.html{
					 flash[:success] = "Qualification created!"	
					 redirect_to user_profile_path(current_profile)
					}
					format.js{}
				end			
			else
				raise 'didnt save'
			end
		end

		def destroy
    	@qualification.destroy
    	redirect_to user_profile_path(current_profile)
    	flash[:success] = "Qualification deleted succesfully!"	  
	end

	private
	def find_qualification
		@qualification = Qualification.find_by_id(params[:id])
	end
	def check_correct_user
		unless user_profile_includes?(@qualification) 
			redirect_to user_profile_path(current_profile)
			flash[:error] = 'Couldnot delete'
		end
	end
end

