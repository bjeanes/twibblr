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
      
      def edit
        @post = Post.find(params[:id])
      end
      
      def update
        @post = Post.find(params[:id])
        
        if @post.update_attributes(params[:post])
          flash[:notice] = "You have updated the post '#{@post.title}'"
          redirect_to :action => :index
        else
          render :edit
        end
      end
      
      def preview
        @post = Post.new(params[:post])
        render :partial => 'preview', :layout => false
      end      
    end
  end
end