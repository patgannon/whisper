class Project
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  referenced_in :owner, :class_name => 'User'
  validates :owner, :presence => true
  validates :name, :presence => true
  references_many :pages
  references_many :domain_names
end

