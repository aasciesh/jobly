class CompanyProfilesController < ApplicationController

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
			EmailConfirmation.confirm_email(@company_profile.user).deliver
	      	respond_to do |format|
	        format.html {render 'show'
	        	flash[:success]= "#{@company_profile.name} has been registered."}
	        	format.js   {render json: {status: 'success', message: 'Successfully registered company.'}}
	        end
		else
			respond_to do |format|
	        	format.html {
	                      @error= @company_profile.errors
	                      render :new }
	        	format.js   {render json: {status: 'failed', message: 'Could not register company.'}}
	        end
		end	
	end

	def show
		@company_profile=CompanyProfile.find(params[:id])		
	end

	def edit		
		@company_profile=CompanyProfile.find(params[:id])	
	end

	def update
		@company_profile=CompanyProfile.find(params[:id])
		if @company_profile.update_attributes(params[:company_profile])
	     	redirect_to company_profile_path
	      	flash.now[:success] = "Information updated successfully!"
    	else
	      	render :edit
	      	flash.now[:error] = "company_profile couldnot be updated!"
    	end			
	end

end
