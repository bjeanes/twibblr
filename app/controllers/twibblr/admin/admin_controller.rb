module Twibblr
  module Admin
    class AdminController < ::Twibblr::BaseController
      before_filter :log_in_required
      layout 'twibblr_admin'
    
      def index
        
      end
    
      protected
    
        def log_in_required
          authenticate_or_request_with_http_basic do |login, password|
            login == Config['username'].to_s && password == Config['password'].to_s
          end
        end
    end
  end
end