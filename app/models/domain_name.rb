class DomainName
  include Mongoid::Document
  referenced_in :project
  field :domain_name, :type => String
  validates :project, :presence => true
  before_save :downcase_my_name
  
  def downcase_my_name
    domain_name.downcase!
  end
end
