class Project
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  referenced_in :owner, :class_name => 'User'
end

