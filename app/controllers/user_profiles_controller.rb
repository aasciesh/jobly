class UserProfilesController < ApplicationController
  def index
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
        format.html {render 'show'}
        format.js
      end
    else
      respond_to do |format|
        format.html {render 'new'}
        format.js
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
