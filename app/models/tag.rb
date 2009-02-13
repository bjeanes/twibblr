class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts, :order => "created_at ASC"
  
  before_save :set_permalink
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
    self.permalink = name.parameterize
  end
  
  def lowercase_name
    self.name.downcase!
  end
end