class Post < ActiveRecord::Base
  has_many :comments, :order => "created_at ASC"
  has_and_belongs_to_many :tags
  
  named_scope :archive, :group => "month(created_at)"

  validates_presence_of :text, :title
  
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