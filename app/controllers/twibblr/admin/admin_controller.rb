module Twibblr
  module Admin
    class AdminController < ::Twibblr::BaseController
      before_filter :ensure_login
    
      protected
    
        def ensure_login
          unless logged_in? && authorised?
            flash[:error] = "You must have permission to access this resource."
            redirect_to root_path
          end
        end
    end
  end
end