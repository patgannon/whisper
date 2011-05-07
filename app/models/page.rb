class Page
  include Mongoid::Document
  include Mongoid::Tree
  include Mongoid::Tree::Ordering
  field :title, :type => String
  field :html, :type => String
#  field :position, :type => Integer
  belongs_to :project
  default_scope order_by(:position, :asc)
  
  has_many :text_areas
  
  before_save :set_position
  
  def set_position
    self.position = parent.children.count unless self.position || parent.nil?
  end
end

