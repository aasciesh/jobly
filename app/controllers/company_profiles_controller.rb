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
			sign_in(@company_profile.user)
			#EmailConfirmation.confirm_email(@company_profile.user).deliver
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
	end

	def edit	
	end

	# TODO: Flash message: Message is shown in edit form while page is redirected alredy. click edit after update to see problem 
	def update
		@company_profile=CompanyProfile.find(params[:id])
		if @company_profile.update_attributes(params[:company_profile])	 
			render 'show'     
	      	respond_to do |format|
		        format.html {		                   
		                    flash[:notice]= "Successfully updated profile."
		                    }
		        format.js {render json: {status: 'success', message: 'Successfully updated profile.'}}
	    	end
    	else
	      	flash[:errors]= @company_profile.errors
      		render 'edit'
    	end			
	end
	private

	    def find_company_profile
	    	@company_profile = CompanyProfile.find(params[:id])
	    end

end
