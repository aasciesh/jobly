class QualificationsController < ApplicationController
before_filter :find_qualification
load_and_authorize_resource

	def new
		@qualification = Qualification.new
		respond_to do |format|
			format.html
			format.js
		end
	end		

	def create
		@qualification = current_profile.qualifications.build(params[:qualification])
		if @qualification.save
			flash[:success] = "Qualification created!"	
			respond_to do |format|
			format.html{
			redirect_to user_profile_path(current_profile)
			}
			format.js
			end	

		else
			@error=@qualification.errors
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
		
		if @qualification.update_attributes(params[:qualification])
			respond_to do |format|
			format.html{
				flash[:success] = "Qualification updated!"	
				redirect_to user_profile_path(current_profile)
			}
			format.js
			end	

		else
			@error=@qualification.errors
			respond_to do |format|
				format.html
				format.js {render 'shared/error'}
			end
		end
	end

	def destroy
		if @qualification.destroy
			respond_to do |format|
				format.html{flash[:success] = "qualification deleted succesfully!"	
				redirect_to user_profile_path(current_profile)
				}
				format.js 
			end
		else
			format.html{flash[:error] = "Could not delete"	
				redirect_to user_profile_path(current_profile)
				}
				format.js {render 'shared/error'}
		end
	end


  	private

	def find_qualification
		@qualification = Qualification.find_by_id(params[:id])
	end

	
end
