class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:activate, :send_confirmation_link, :update, :destroy]
  def new

  end
  def create
  end
  def update
  end
  #OPTIMIZE: This block of code is too unRubyish
  def activate
  	@user= current_user
  	if @user.activated == true
  		redirect_to user_profile_path(@user.profile)
   	elsif (params[:code] == @user.confirmation_code) && (@user.confirmation_sent_date >= DateTime.now - 2.weeks)
      if @user.update_attribute('activated', true)
     		flash[:notice] = "Your account has been successfully activated."
     		redirect_to user_profile_path(@user.profile)
      else 
        Rails.logger.info(@user.errors.messages.inspect)
        redirect_to root_path
      end
   	elsif (@user.confirmation_sent_date < DateTime.now - 2.weeks)
   		flash[:error] = "Couldn't activate your account becasue your confirmation link is older then 2 weeks."
   	elsif (params[:code] != @user.confirmation_code)
   		flash[:error] = "Your confirmation link is not valid."
   	end
 			
  end

  def send_confirmation_link
  	@user= current_user
    @user.email = params[:user][:email] if !params[:user][:email].blank?
  	@user.confirmation_code= SecureRandom.hex
  	@user.confirmation_sent_date = DateTime.now
  	if @user.save(validate: false)
      flash[:notice]= "Email has been sent to #{@user.email}"
  		EmailConfirmation.confirm_email(@user).deliver
      redirect_to root_path
  	else
  		flash[:errors]= @user.errors
  		render 'activate'
  	end
  end
  def destroy
  end
end
