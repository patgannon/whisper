class Inquiry
  include Mongoid::Document
  belongs_to :project
  field :name, :type => String
  field :email, :type => String
  field :subject, :type => String
  field :message, :type => String
  
  validates :project, :presence => true
  validates :name, :presence => true
  validates :email, :presence => true
  validates :subject, :presence => true
  validates :message, :presence => true

end
