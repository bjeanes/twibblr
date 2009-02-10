class Comment < ActiveRecord::Base
  belongs_to :post  
  validates_presence_of :name, :email
end
