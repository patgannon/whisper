class Page
  include Mongoid::Document
  include Mongoid::Tree
  field :title, :type => String
  field :html, :type => String
  field :position, :type => Integer
  belongs_to :project
  default_scope order_by(:position, :asc)
  
  before_save :set_position
  
  def set_position
    self.position = parent.children.count unless self.position || parent.nil?
  end
end

