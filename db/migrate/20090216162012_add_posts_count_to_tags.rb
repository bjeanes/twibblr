class AddPostsCountToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :posts_count, :integer, :default => 0
  end

  def self.down
    remove_column :tags, :posts_count
  end
end
