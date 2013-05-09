class ExperiencesController < ApplicationController
before_filter :find_experience
load_and_authorize_resource

	def new
		@experience = Experience.new
		respond_to do |format|
			format.html
			format.js
		end
	end		

	def create
		@experience = current_profile.experiences.build(params[:experience])
		if @experience.save
			flash[:success] = "Experience created!"	
			respond_to do |format|
			format.html{
			flash[:success] = "Experience created!"	
			redirect_to user_profile_path(current_profile)
			}
			format.js
			end	

		else
			@error=@experience.errors
			respond_to do |format|
				format.html
				format.js {render 'shared/error'}
			end
		end
	end

	def edit
		respond_to do |format|
				format.html
				format.js 
			end
	end

	def update
		
		if @experience.update_attributes(params[:experience])
			respond_to do |format|
			format.html{
				flash[:success] = "Experience updated!"	
				redirect_to user_profile_path(current_profile)
			}
			format.js
			end	

		else
			@error=@experience.errors
			respond_to do |format|
				format.html
				format.js {render 'shared/error'}
			end
		end
	end

	def destroy
		@experience.destroy
		respond_to do |format|
			format.html{flash[:success] = "Experience deleted succesfully!"	
			redirect_to user_profile_path(current_profile)
			}
			format.js 
		end
	end


  	private

	def find_experience
		@experience = Experience.find_by_id(params[:id])
	end

	
end
