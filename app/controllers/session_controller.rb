class SessionController < ApplicationController
 
  def new
    respond_to do |format|
        format.js {
        }
        format.html {
        }
        end
  end
  def create
  	user= User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
      sign_in user
      respond_to do |format|
        format.js {
          render json: {state: 'successful', message: 'You are logged in now.'}
        }
        format.html {
          redirect_back_or user.profile
          flash[:notice]= "You are logged in now."
        }
        end
      else
        #TODO Flash message: Message is not showing properly(shown in different page) when create fails

        flash.now[:alert]= "We couldn't recognize you."
        respond_to do |format|
          format.js {render 'shared/error'}
          format.html {render 'new'}
        end
      end
  end

  def destroy
  	 sign_out
     redirect_to root_path
     flash[:notice]= "Thank you for using Jobly. See you soon"
  end
end
