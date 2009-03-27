module Twibblr
  module Admin
    class PostsController < AdminController
      def index
        @posts = Post.all        
      end
      
      def new
        @post = Post.new
      end
      
      def create
        @post = Post.new(params[:post])
        
        if @post.save
          flash[:notice] = "You have created the post '#{@post.title}'"
          redirect_to :action => :index
        else
          render :new
        end
      end
    end
  end
end