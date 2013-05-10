class QualificationsController < ApplicationController

	before_filter :find_qualification
	include SessionHelper
	load_and_authorize_resource

	def new			
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
    	redirect_to user_profile_path(@qualification.user_profile)
    	flash[:success] = "Qualification deleted succesfully!"	  
	end

	def edit
	end
	def update
	end

	private
	def find_qualification
		@qualification = Qualification.find_by_id(params[:id])
	end
	
end

