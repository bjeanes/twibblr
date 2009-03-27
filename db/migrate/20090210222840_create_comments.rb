class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :twibblr_comments do |t|
      t.references :post
      t.text :body
      t.string :name
      t.string :email
      t.string :website
      t.timestamps
    end
  end

  def self.down
    drop_table :twibblr_comments
  end
end
