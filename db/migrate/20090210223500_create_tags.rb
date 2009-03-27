class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :twibblr_tags do |t|
      t.string :name
      t.string :permalink
    end
    
    create_table :twibblr_posts_tags, :id => false do |t|
      t.references :tag
      t.references :post
    end
    
    add_index :twibblr_tags, :name,      :unique => true
    add_index :twibblr_tags, :permalink, :unique => true
    add_index :twibblr_posts_tags, [:post_id, :tag_id], :unique => true
  end

  def self.down
    drop_table :twibblr_tags
    drop_table :twibblr_posts_tags
  end
end
