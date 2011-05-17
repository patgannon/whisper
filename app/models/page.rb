class Page
  include Mongoid::Document
  include Mongoid::Tree
  include Mongoid::Tree::Ordering
  field :title, :type => String
  field :html, :type => String

  belongs_to :project
  default_scope order_by(:position, :asc)
  
  has_many :elements, :class_name => 'PageElement'
  
  before_save :set_position
  
  def set_position
    self.position = (self.position || parent.nil?) ? 0:parent.children.count
  end
end

