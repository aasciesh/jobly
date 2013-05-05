class VacanciesController < ApplicationController

	def new
		@vacancy=Vacancy.new
	end

	def index
		@vacancies=Vacancy.all
	end

	def create
		@vacancy=Vacancy.new(params[:vacancy])
		@vacancy.company_profile=current_profile
		if @vacancy.save
			respond_to do |format|
		        format.html {render 'show'
		        flash[:success]= "#{@vacancy.title}, has been created."}
		        format.js   {render json: {status: 'success', message: 'Successfully created vacancy.'}}
      		end
		else
			respond_to do |format|
		        format.html {
		                      @error= @user_profile.errors
		                      render 'new'
		                  	}
		        format.js 	{ render json: {status: 'failed', message: 'Could not create vacancy.'} }
		    end
		end	
	end

	def show
		@vacancy=Vacancy.find(params[:id])		
	end

	def edit		
		@vacancy=Vacancy.find(params[:id])	
	end

	def update
		@vacancy=Vacancy.find(params[:id])
		if @vacancy.update_attributes(params[:vacancy])
	     	redirect_to vacancy_path(@vacancy)
	      	flash.now[:success] = "Information updated successfully!"
    	else
	      	render :edit
	      	flash.now[:error] = "vacancy couldnot be updated!"
    	end			
	end

end
