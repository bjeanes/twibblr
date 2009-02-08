ActionController::Routing::Routes.draw do |map|
  map.posts "posts", :controller => "posts"
  
  map.with_options :controller => "assets" do |assets|
    assets.connect "twibblr"
    assets.connect "twibblr/:stylesheet.css", :action => "stylesheet"
    assets.connect "twibblr/:javascript.js",  :action => "javascript"
  end
end
