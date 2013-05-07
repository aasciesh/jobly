class ApplicationsController < ApplicationController

	load_and_authorize_resource

	def new		
	end
	
	def create
		@application=Application.new(params[:application])
		if @application.save		
	      	respond_to do |format|
	        format.html {	        
	        	redirect_to vacancy_path(@application.vacancy_id)
	        	flash[:success]= "Your application has been sent !!"}
	        	format.js   {render json: {status: 'success', message: 'Successfully applied for this vacancy.'}}
	        end
		else
			respond_to do |format|
	        	format.html {
	                      @error= @application.errors
	                      render :new }
	        	format.js   {render json: {status: 'failed', message: 'Could not apply for vacancy.'}}
	        end
		end	
	end



	def update
		@application=Application.find(params[:id])
		if @application.update_attributes(params[:application])	 	 
		 redirect_to vacancy_path(@application.vacancy_id) 		    
	      	respond_to do |format|
		        format.html {		                   
		                    flash.now[:success]= "Successfully bookmarked applicant."
		                  
		                    }
		        format.js {render json: {status: 'success', message: 'Successfully bookmarked applicant.'}}
	    	end
    	else
	      	@error= @application.errors
      		redirect_to :back 
    	end			
	end
end
