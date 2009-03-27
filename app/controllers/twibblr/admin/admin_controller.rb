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
            login == CONFIG['username'].to_s && password == CONFIG['password'].to_s
          end
        end
    end
  end
end