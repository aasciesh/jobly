class SessionController < ApplicationController
  def new
  end
  def create
  	user= User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
      respond_to do |format|
        format.js {
          sign_in user
          render json: {state: 'successful', message: 'You are logged in now.'}
        }
        format.html {
          sign_in user
          redirect_back_or root_path
          flash[:notice]= "You are logged in now."
        }
        end
      else
        respond_to do |format|
          format.js {render json: {state: 'failed', message: 'Incorrect credentials'}}
          format.html {
            render 'new'
            flash[:alert]= "We couldn't recognize you."}
        end
      end
  end

  def destroy
  	 sign_out
     redirect_to root_path
     flash[:notice]= "Thank you for using Jobly. See you soon"
  end
end
