class CompanyProfilesController < ApplicationController
	
	load_and_authorize_resource

	def new
		@company_profile=CompanyProfile.new
		@company_profile.build_user

	    respond_to do |format|
	      format.html 
	      format.js
	    end
	end

	def index
		@company_profiles=CompanyProfile.all
	end

	def create
		@company_profile=CompanyProfile.new(params[:company_profile])
		if @company_profile.save
		flash[:success]= "#{@company_profile.name} has been registered."	
		sign_in
		EmailConfirmation.confirm_email(@company_profile.user).deliver				
	      	respond_to do |format|
	        	format.html { redirect_to company_profile_path(@company_profile)	}        	
	        	format.js 
	        end
		else
			@error= @company_profile.errors
			respond_to do |format|
	        	format.html {render :new }
	        	format.js 
	        end
		end	
	end

	def show	
	end

	def edit	
	end

	def update
		@company_profile=CompanyProfile.find(params[:id])
		if @company_profile.update_attributes(params[:company_profile])	 
			    
	      	respond_to do |format|
		        format.html {		                   
		                    flash.now[:notice]= "Successfully updated profile."
		                    render 'show' 
		                    }
		        format.js {render json: {status: 'success', message: 'Successfully updated profile.'}}
	    	end
    	else
	      	@error= @company_profile.errors
      		render 'edit'
    	end			
	end

	def edit_banner	
		@company_profile= CompanyProfile.find_by_id(params[:id])
		respond_to do |format|
			format.js
		end
	end
	
end
