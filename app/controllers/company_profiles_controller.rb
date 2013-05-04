class CompanyProfilesController < ApplicationController
	before_filter :find_company_profile, only: [:show, :edit]
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
			#EmailConfirmation.confirm_email(@company_profile.user).deliver
	      	respond_to do |format|
	        format.html {redirect_to 'show'
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
	private

	    def find_company_profile
	    	@company_profile = CompanyProfile.find(params[:id])
	    end

end
