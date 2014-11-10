class StaticPagesController < ApplicationController
    skip_before_action :require_login

    # GET /
    def index
    end
    
    # GET /about
    def about
    end
    
    # GET /contact
    def contact
    end
end
