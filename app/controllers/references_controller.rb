class ReferencesController < ApplicationController
	
	before_filter :find_reference
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
	if @reference.update_attributes(params[:reference])
			respond_to do |format|
			format.html{
				flash[:success] = "Reference updated!"	
				redirect_to user_profile_path(current_profile)
			}
			format.js
			end	

		else
			@error=@reference.errors
			respond_to do |format|
				format.html
				format.js {render 'shared/error'}
			end
		end	
	end

	private
	def find_reference
		@reference = Reference.find_by_id(params[:id])
	end
	
end

