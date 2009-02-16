class Tag < ActiveRecord::Base
  default_scope :order => "posts_count"
  
  has_many :posts_tags
  has_many :posts, :through => :posts_tags, :order => "created_at ASC"
  
  before_create :set_permalink
  before_save :lowercase_name
  
  def to_s
    name
  end
  
  def to_param
    permalink
  end

  def self.[](identifier)
    identifier.is_a?(Fixnum) ? find(identifier) : find(:first, :conditions => ["name = :name OR permalink = :name", {:name => identifier.to_s}])
  rescue
    nil
  end
  
  private
  
  def set_permalink
    self.permalink = name.parameterize if permalink.blank?
  end
  
  def lowercase_name
    self.name.downcase!
  end
end