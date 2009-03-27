module Twibblr
  module Admin
    class PostsController < AdminController
    
      def index
        render_text "Admin Posts will go here"
      end
    end
  end
end