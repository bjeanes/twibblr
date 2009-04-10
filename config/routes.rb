YEAR_REGEX  = /\d{4}/
MONTH_REGEX = /(?:0?[1-9]|1[012])/
DAY_REGEX   = /(?:0?[1-9]|[12][0-9]|3[01])/
PARAM_REGEX = /\d+(?:-[a-z0-9_-]+?)?/

ActionController::Routing::Routes.draw do |map|
  map.with_options :conditions => {:method => :get} do |get|
    get.with_options :controller => "twibblr/posts" do |posts|
      posts.with_options :action => "index" do |list_posts|
        list_posts.root
        list_posts.posts "/posts.:format"
        list_posts.map "/:year.:format",             :requirements => {:year => YEAR_REGEX}
        list_posts.map "/:year/:month.:format",      :requirements => {:year => YEAR_REGEX, :month => MONTH_REGEX}
        list_posts.map "/:year/:month/:day.:format", :requirements => {:year => YEAR_REGEX, :month => MONTH_REGEX, :day => DAY_REGEX}
      end
      
      posts.map "/tags/:tag", :action => "by_tag"
    
      options = {:action => "show", :requirements => 
        {:year => YEAR_REGEX, :month => MONTH_REGEX, :day => DAY_REGEX, :id => PARAM_REGEX}}
    
      posts.post "/:year/:month/:day/:id", options
      posts.post "/posts/:id", :action => "show"
      posts.formatted_post "/:year/:month/:day/:id.:format", options
    end
  end
  
  map.namespace :admin, :namespace => "twibblr/" do |admin|
    admin.root :controller => 'admin', :action => 'index'
    admin.resources :posts, :collection => {:preview => :post}
    admin.resources :tags
  end
end