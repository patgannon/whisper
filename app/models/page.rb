class Page
  include Mongoid::Document
  field :title, :type => String
  field :html, :type => String
  referenced_in :project
end
