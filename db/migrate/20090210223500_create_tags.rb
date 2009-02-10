class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name
      t.string :permalink
    end
    
    create_table :posts_tags, :id => false do |t|
      t.references :tag
      t.references :post
    end
    
    add_index :tags, :name,      :unique => true
    add_index :tags, :permalink, :unique => true
    add_index :posts_tags, [:post_id, :tag_id], :unique => true
  end

  def self.down
    drop_table :tags
    drop_table :posts_tags
  end
end
