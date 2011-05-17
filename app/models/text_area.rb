class TextArea < PageElement
  field :html, :type => String
  
  def partial
    'text_area'
  end
end
