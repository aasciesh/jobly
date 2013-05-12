class VacanciesController < ApplicationController
load_and_authorize_resource
	
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
			flash[:success]= @vacancy.title+", has been created." 
			respond_to do |format|
		        format.html {redirect_to vacancy_path(@vacancy)}		        
		        format.js 
      		end
		else
			@error= @vacancy.errors
			respond_to do |format|
		        format.html { render 'new' }
		        format.js {render 'shared/error'}
		    end
		end	
	end

	def show
		@vacancy=Vacancy.find(params[:id])
		session[:current_vacancy]=@vacancy.id		
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


	def destroy
		if @vacancy.destroy
			respond_to do |format|
				format.html{flash[:success] = "vacancy deleted succesfully!"	
				redirect_to vacancies_path
				}
				format.js 
			end
		else
			format.html{flash[:error] = "Could not delete"	
				redirect_to vacancy_path(@vacancy)
				}
				format.js {render 'shared/error'}
		end
	end

end
