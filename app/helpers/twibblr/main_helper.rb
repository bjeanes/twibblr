module Twibblr::MainHelper
  def render_posts(*args, &block)
    # if they are fetching posts in the controller
    # then awesome(!) otherwise get it for them
    posts = @posts || Twibblr::Post
    
    # @posts can be Post from controller
    posts = posts.all(*args) if posts == Twibblr::Post

    if block_given?
      posts.each do |post|
        render_post(post, &block)
      end
    else
      render :partial => 'post', :collection => posts
    end
  end

  def render_tags(*args)
    raise "No Block Given" unless block_given?
    
    options = {:order => "name"}.merge(args.extract_options!)
    args << options
    
    (@tags || Tag.in_use.all(*args)).each {|tag| yield(tag)}
  end
  
  def site_name
    config['site_name'].titleize || 'My website'
  end
  
  def config
    Twibblr::CONFIG
  end

  private

  def render_post(post, &block)
    raise "No block given" unless block_given?
    case block.arity
    when 1 then yield(post)
    when 2 then yield(post.title, post.body)
    when 3 then yield(post.title, post.body, post.created_at)
    when 4 then yield(post.title, post.body, post.created_at, post.tags)
    when 5 then yield(post.title, post.body, post.created_at, post.tags, post.comments)
    else raise "Parameter Error"
    end
  end
end