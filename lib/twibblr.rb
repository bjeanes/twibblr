# Define a master controller for plugin to have defaults set everywhere
class TwibblrController < ApplicationController  
  helper :all
  filter_parameter_logging :password
  layout "twibblr"
  
  protected
  
    def development?
      RAILS_ENV == "development"
    end
end
