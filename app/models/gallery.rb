class Gallery
  include Mongoid::Document
  field :name, :type => String
  validates :name, :presence => true
  belongs_to :project
  has_many :images
end

