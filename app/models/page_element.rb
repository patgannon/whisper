class PageElement
  include Mongoid::Document
  include Whisper::Sortable
  
  belongs_to :page, :inverse_of => :elements
  
  def partial
    raise NotImplementedError
  end
end

