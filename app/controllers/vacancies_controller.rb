class VacanciesController < ApplicationController

	def new
		@vacancy=Vacancy.new
	end

	def index
		@vacancies=Vacancy.all
	end

	def create
		@vacancy=Vacancy.new(params[:vacancy])
		if @vacancy.save
			redirect_to vacancies_path
			flash.now[:success] = "Vacancy created successfully !"
		else
			render :new
			flash.now[:error] = "Something went wrong!"
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
