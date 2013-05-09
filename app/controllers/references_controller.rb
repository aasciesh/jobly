class ReferencesController < ApplicationController
	
	before_filter :find_reference
	before_filter :check_correct_user, only: [:destroy]

	def new
			@references = Reference.new
	end		

		def create
			@reference = current_profile.references.build(params[:reference])
			if @reference.save
				flash[:success] = "Reference created!"	
				respond_to do |format|
					format.html{
					 flash[:success] = "Reference created!"	
					 redirect_to user_profile_path(current_profile)
					}
					format.js{}
				end			
			else
				raise 'didnt save'
			end
		end

	def destroy
    	@reference.destroy
    	redirect_to user_profile_path(current_profile)
    	flash[:success] = "Reference deleted succesfully!"	  
	end

	private
	def find_reference
		@reference = Reference.find_by_id(params[:id])
	end
	def check_correct_user
		unless user_profile_includes?(@reference) 
			redirect_to user_profile_path(current_profile)
			flash[:error] = 'Couldnot delete'
		end
	end
end

