class Post < ActiveRecord::Base
  default_scope :order => "created_at DESC"
  
  has_many :comments, :order => "created_at ASC"
  has_and_belongs_to_many :tags, :order => "name ASC"
  
  named_scope :archive, :group => "month(created_at)"

  validates_presence_of :body, :title
  
  delegate :day, :month, :year, :to => :created_at
  
  def date
    created_at.to_date.to_s(:long_ordinal)
  end
  
  def to_s
    title
  end
  
  def to_param
    if title.blank?
      id
    else
      "#{id}-#{title.parameterize}"
    end
  end
end