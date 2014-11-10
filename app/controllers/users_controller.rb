class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create] # Skip some filters
  before_action :set_user, only: [:show, :edit, :update, :destroy] # Before the user is set filter
  before_action :require_admin, except: [:show, :new, :create] # require the user to be admin filter
  
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    3.times { @user.timezones.build}
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.acl = 10; # Default access level
    if @user.save
        UserMailer.welcome_email(@user).deliver # Email the welcome email

        if is_admin? # if user is admin, redirect to the user index page

          # If you notice below, there is a success flash type message passed to the view.
          # By default rails only recognize 2 flash type messages in the view, :notice and :alert and :flash iirc.
          # in the application_controller.rb we defined some custom flash types and attached some bootstrap classes to it
          # in the helpers/application_helper.rb

          # Open helpers/application_helper.rb and views/shared/_flash_messages.html.erb to understand the logic

          redirect_to user_path(id: @user.id), success: 'successfully added user!'

        else # if normal user, redirect to sign in page
          redirect_to sign_in_path, success: 'Thanks for Signing Up!'
        end

    else
        render action: "new"
    end
  end

  # PATCH/PUT /users/1
  def update
      if @user.update(user_params)
        redirect_to @user, success: 'User was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, timezones_attributes: [:id, :region, :_destroy])
    end
end
