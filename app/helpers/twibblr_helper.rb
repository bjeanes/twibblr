module TwibblrHelper
  def render_posts
    if block_given?
      @posts.each { |post| yield post.title, post.body, post.created_at }
    else
      render :partial => @posts
    end
  end
end