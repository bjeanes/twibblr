class AddHtmlBodyToPosts < ActiveRecord::Migration
  def self.up
    add_column :twibblr_posts, :html_body, :text
  end

  def self.down
    remove_column :twibblr_posts, :html_body
  end
end
