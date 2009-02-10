class PostsController < TwibblrController
  def index
    @posts = Post.find(:all)

    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end
  
  def archive
    # show posts in a certain time period (year, month, day, etc)
  end
  
  def by_tag
    @posts = Tag.find_by_permalink(params[:tag]).posts
  rescue
    flash[:error] = "Tag '#{params[:tag]}' does not exist."
    redirect_to :action => :index
  end

  def show
    @post = Post.find(params[:id], :include => :comments)

    @comments = @post.comments
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.rss { render :layout => false }
    end
  end
end