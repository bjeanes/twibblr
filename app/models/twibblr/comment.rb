class Twibblr::Comment < ActiveRecord::Base
  set_table_name :twibblr_comments
  belongs_to :post  
  validates_presence_of :name, :email
end
