class Twibblr::Post < ActiveRecord::Base
  set_table_name :twibblr_posts
  
  default_scope :order => "created_at DESC"
  
  has_many :comments, :order => "created_at ASC"
  has_many :posts_tags
  has_many :tags, :through => :posts_tags, :order => "name ASC"
  
  named_scope :archive, :group => "month(created_at)"

  validates_presence_of :body, :title

  %w{year month day}.each do |time|
    delegate time, :to => :created_at
    named_scope :"in_#{time}", lambda { |num| {:conditions => ["#{time.upcase}(created_at) = ?", num] } }
  end

  def date
    created_at.to_date.to_s(:long_ordinal)
  end
  
  def to_s
    title
  end

  def link
    @link ||= "/#{created_at.year}/#{created_at.month}/#{created_at.day}/#{to_param}"
  end
  
  def to_param
    if title.blank?
      id
    else
      "#{id}-#{title.parameterize}"
    end
  end
end