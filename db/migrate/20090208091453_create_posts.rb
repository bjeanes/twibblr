class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :twibblr_posts, :force => true do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :twibblr_posts
  end
end
