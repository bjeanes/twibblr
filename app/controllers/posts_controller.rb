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
    Tag.find_by_permalink(params[:tag]).posts
  end

  def show
    @post = Post.find(params[:id], :include => :comments)

    @comments = @post.comments
    @comment = Comment.new

    @extended_meta_data = true
    respond_to do |format|
      format.html # show.html.erb
      format.rss { render :layout => false }
    end
  end
end