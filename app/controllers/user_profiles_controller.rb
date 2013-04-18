class UserProfilesController < ApplicationController
before_filter :find_user_profile, on: [:show, :edit]

  def index
    @user_profile = UserProfile.all
  end

  def show
  end

  def new
    @user_profile = UserProfile.new
    @user_profile.build_user

    respond_to do |format|
      format.html 
      format.js
    end
  end

  def create
    @user_profile = UserProfile.new(params[:user_profile])
    if @user_profile.save
      respond_to do |format|
        format.html {render 'show'
          flash[:success]= "#{@user_profile.firstname} #{@user_profile.lastname}, your profile has been created."}
        format.js   {render json: {status: 'success', message: 'Successfully created profile.'}}
      end
    else
      respond_to do |format|
        format.html {render 'new'}
        format.js   {render json: {status: 'failed', message: 'Could not create profile.'}}
      end
    end
  end

  def edit
  end

  def update
    if @user_profile.update_attributes(params[:user_profile])
     
      respond_to do |format|
        format.html {
                      render 'show'
                      flash[:notice]= "Successfully updated profile."
                    }
        format.js    {render json: {status: 'success', message: 'Successfully updated profile.'}}
      end
    else
      respond_to do |format|
        format.html {
                      render 'show'
                      flash[:notice]= "Successfully updated"
                    }
        format.js    {render json: {status: 'failed', message: 'Could not update profile.'}}
      end
      flash[:errors]= @user.errors
      render action: 'edit'
    end 
  end

  def destroy
  end

  private

    def find_user_profile
     @user_profile = UserProfile.find_by_id(params[:id])
    end
end
