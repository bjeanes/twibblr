YEAR_REGEX  = /\d{4}/
MONTH_REGEX = /(?:0?[1-9]|1[012])/
DAY_REGEX   = /(?:0?[1-9]|[12][0-9]|3[01])/
PARAM_REGEX = /\d+(?:-[a-z0-9_-]+?)?/

ActionController::Routing::Routes.draw do |map|
  map.with_options :conditions => {:method => :get} do |get|
    get.with_options :controller => "posts" do |posts|
      posts.with_options :action => "index" do |list_posts|
        list_posts.posts "/posts"
        list_posts.formatted_posts "/posts.:format"
        list_posts.map "/:year",             :requirements => {:year => YEAR_REGEX}
        list_posts.map "/:year/:month",      :requirements => {:year => YEAR_REGEX, :month => MONTH_REGEX}
        list_posts.map "/:year/:month/:day", :requirements => {:year => YEAR_REGEX, :month => MONTH_REGEX, :day => DAY_REGEX}
      end
      
      posts.map "/tags/:tag", :action => "by_tag"
    
      options = {:action => "show", :requirements => {:year => YEAR_REGEX, :month => MONTH_REGEX, :day => DAY_REGEX, :id => PARAM_REGEX}}
    
      posts.post "/:year/:month/:day/:id", options
      posts.formatted_post "/:year/:month/:day/:id.:format", options
    end
    
    get.with_options :controller => "assets" do |assets|
      assets.connect "/twibblr"
      assets.connect "/twibblr/:stylesheet.css", :action => "stylesheet"
      assets.connect "/twibblr/:javascript.js",  :action => "javascript"
    end
  end
end
