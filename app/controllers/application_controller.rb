class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  add_flash_types :error, :success # add custom flash types
  
  # add the filter defined below 
  # NOTE!!! all controllers now require logins
  # you can skip this filter
  # try opening the static_pages controller and look at line #2
  before_action :require_login 
  
  include SessionsHelper # Include the session helper so that we can use like so below

  # Here we define filters that can be used across all controllers
  private
    def require_login # Require user to be logged in filter
        unless logged_in? 
          flash[:error] = "You must be logged in to access this section"
          redirect_to sign_in_url # halts request cycle
        end
    end
    
    def require_admin # Require user level to be admin or level to 1
        unless current_user.acl == 1 
          flash[:error] = "You must have the required access level to this section"
          redirect_to root_url # halts request cycle
        end
    end
end
