class PostsController < TwibblrController
  before_filter :filter_by_time, :only => [:index, :show]
  
  def index
    @posts = @posts.all
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end
  
  def by_tag
    @posts = Tag.find_by_permalink(params[:tag]).posts
    render :index
  rescue
    flash[:error] = "Tag '#{params[:tag]}' does not exist."
    redirect_to :action => :index
  end

  def show
    @post = @posts.find(params[:id].to_i, :include => :comments)

    @comments = @post.comments
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.rss { render :layout => false }
    end
  end
  
  protected
  
    # TODO: this needs to be cleaner!!!
    def filter_by_time
      @posts = Post
      @posts = @posts.in_year(params[:year]) if params[:year]
      @posts = @posts.in_month(params[:month]) if params[:month]
      @posts = @posts.in_day(params[:day]) if params[:day]
    end
end