class CompanyProfilesController < ApplicationController

	def new
		@company_profile=CompanyProfile.new
	end

	def index
		@company_profiles=CompanyProfile.all
	end

	def create
		@company_profile=CompanyProfile.new(params[:company_profile])
		if @company_profile.save
			redirect_to company_profiles_path
			flash.now[:success] = "Welcome to Jobly!"
		else
			render :new
			flash.now[:error] = "Something went wrong!"
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
