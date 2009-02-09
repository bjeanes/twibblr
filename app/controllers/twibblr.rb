# Define a master controller for plugin to have defaults set everywhere
class TwibblrController < ApplicationController  
  helper :all
  filter_parameter_logging :password
  layout :choose_layout
  
  protected
  
    def development?
      RAILS_ENV == "development"
    end
    
    def choose_layout
      # This ivar could be set by some form of site config later
      @layout ||= "twibblr"
    end
end
