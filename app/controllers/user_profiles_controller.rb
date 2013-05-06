class UserProfilesController < ApplicationController
before_filter :find_user_profile, only: [:show, :edit, :show_cv]

  def index
    @user_profile = UserProfile.all
  end

  def show
  end

  def show_cv
    
  end

  def new
    @user_profile = UserProfile.new
    @user_profile.build_user
    @company_profile=CompanyProfile.new
    @company_profile.build_user

    respond_to do |format|
      format.html 
      format.js
    end
  end

  def create
    @user_profile = UserProfile.new(params[:user_profile])
    if @user_profile.save
      sign_in(@user_profile.user)
      EmailConfirmation.confirm_email(@user_profile.user).deliver
      respond_to do |format|
        format.html {render 'show'
          flash[:success]= "#{@user_profile.firstname} #{@user_profile.lastname}, your profile has been created."}
        format.js   {render json: {status: 'success', message: 'Successfully created profile.'}}
      end
    else
      respond_to do |format|
        format.html {
                      @error= @user_profile.errors
                      render 'new'}
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
                      flash[:errors]= "Update failed"
                    }
        format.js    {render json: {status: 'failed', message: 'Could not update profile.'}}
      end  
      render 'edit'
      flash[:errors]= @user_profile.errors
    
    end 
  end

  def destroy
  end

  private

    def find_user_profile
     @user_profile = UserProfile.find(params[:id])
    end
end
