class CompanyProfilesController < ApplicationController

	def new
		@company_profile=CompanyProfile.new
		@company_profile.build_user
	end

	def index
		@company_profiles=CompanyProfile.all
	end

	def create
		@company_profile=CompanyProfile.new(params[:company_profile])
		if @company_profile.save
			redirect_to company_profiles_path
			sign_in(@company_profile.user)
			flash.now[:success] = "Welcome to Jobly!"
		else
			render 'new'
			@error= @company_profile.errors
			
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
