class PageElement
  include Mongoid::Document
  include Whisper::Sortable
  
  belongs_to :page, :inverse_of => :elements
  
  def name
    self.class.name.underscore
  end
  
  def partial(action=:show)
    act_str = action == :show ? '' : "#{action}_"
    "page_elements/#{act_str}#{name}"
  end
end

