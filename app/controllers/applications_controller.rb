class ApplicationsController < ApplicationController

	load_and_authorize_resource
	def new		
		@application = Application.new
		@application.vacancy_id=params[:id]
		respond_to do |format|
			format.html
			format.js
		end
	end
	
	def create		
		@application.user_id=current_profile.id
		if @application.save	
			flash[:success]= "Your application has been sent !!"
	      	respond_to do |format|
		        format.html { redirect_to vacancy_path(@application.vacancy_id) }
		        format.js 
	        end
		else 
			@error= @application.errors
			respond_to do |format|
	        	format.html {render :new }
	        	format.js   {render 'shared/error'}
	        end
		end	
	end

	def update		
		if @application.update_attributes(params[:application])	 
			flash.now[:success]= "Successfully bookmarked applicant."			 	    
	      	respond_to do |format|
		        format.html { redirect_to vacancy_path(@application.vacancy_id) }
		        format.js 
	    	end
    	else
	      	@error= @application.errors
			respond_to do |format|
	        	format.html {render :edit }
	        	format.js   {render 'shared/error'}
	        end
    	end			
	end


end
