class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    # GET /sign_in
	def new
	end
  	
  	# POST /sign_in
	def create
		@user = User.where(email: params[:session][:email]).first
		
		if @user
			if @user.authenticate(params[:session][:password]) 
			   session[:user_id] = @user.id
			   redirect_to user_path(id: @user.id), success: 'Successfully Signed In'
			else
				flash.now[:error] = "Incorrect Username/Password"
				render :new
			end
		else
			flash.now[:alert] = "User could not be found"
			render :new
		end
	end

	# DELETE /sign_out
	def destroy
        if session[:user_id]
    	   session[:user_id] = nil 
    	   redirect_to root_path, notice: 'Successfully signed Out!'
        end
	end
end
