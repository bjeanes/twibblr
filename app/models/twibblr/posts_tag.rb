class Twibblr::PostsTag < ActiveRecord::Base
  set_table_name :twibblr_posts_tags
  belongs_to :post
  belongs_to :tag, :counter_cache => "posts_count"
end