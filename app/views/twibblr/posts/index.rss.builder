xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "TODO"
    xml.description "TODO"
    xml.link formatted_posts_url(:format => :rss)
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.created_at.to_s(:rfc822)
        
        link = post_url(post.year, post.month, post.day, post.to_param)
        
        xml.link link
        xml.guid link
      end
    end
  end
end