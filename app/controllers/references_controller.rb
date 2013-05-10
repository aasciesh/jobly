class ReferencesController < ApplicationController
	
	before_filter :find_reference
	include SessionHelper
	load_and_authorize_resource

	

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

	def edit		
	end
	def update		
	end

	private
	def find_reference
		@reference = Reference.find_by_id(params[:id])
	end
	
end

