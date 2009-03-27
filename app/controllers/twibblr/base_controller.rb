# Define a master controller for plugin to have defaults set everywhere
module Twibblr
  class BaseController < ::ApplicationController  
    helper 'twibblr/main'
    filter_parameter_logging :password
    layout :choose_layout
  
    protected
  
      def development?
        RAILS_ENV == "development"
      end

      def choose_layout
        CONFIG['layout']
      end
  end
end