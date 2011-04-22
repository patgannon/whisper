class Article
  include Mongoid::Document

  field :title, :type => String
  field :body, :type => String
  field :published, :type => Boolean
  field :date_created, :type => Time
  field :date_modified, :type => Time
  field :date_published, :type => Time
  belongs_to :project
  
  after_initialize :init
  before_create :set_date_created, :set_pub_date
  before_save :set_date_modified, :set_pub_date
  
  def init
    self.date_created ||= DateTime.now
    self.date_modified ||= DateTime.now
  end
  
  def set_date_created
    self.date_created ||= DateTime.now
    self.date_modified ||= DateTime.now
  end
  
  def set_date_modified
    self.date_modified ||= DateTime.now
  end
  
  def set_pub_date
    if self.published and self.date_published.nil?
      self.date_published = DateTime.now
    end
  end
end

