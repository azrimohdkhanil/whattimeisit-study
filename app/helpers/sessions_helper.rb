module SessionsHelper #Session helpers to be used in views and also controllers. Note! to use in controller : "inlcude SessionHelper" in the application_controller
    
    # Get current user, returns the user object or nil if it is not set
    def current_user
        if !session[:user_id].blank?
          current_user = User.find(session[:user_id]) 
        else
            current_user = nil
        end
    end
    
    # if current user is logged in, returns bool
    def logged_in?
        if current_user
           true
        else
           false
        end
    end
    
    # if current user is admin, returns bool
    def is_admin?
        if logged_in? && current_user.acl == 1
           true
        else
           false
        end
    end
end
