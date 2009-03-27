module Twibblr
  module Authentication
    protected
    
    def logged_in?
      !!current_user
    end
    
    def current_user
      nil
    end
    
    def authorised?
      false
    end
    
    def authorized?
      authorised?
    end
  end
end