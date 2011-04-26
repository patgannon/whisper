class Project
  include Mongoid::Document
  include Mongoid::Paperclip  
  field :name, :type => String
  field :description, :type => String
  field :app_id
  field :api_key
  field :app_secret
  field :layout
  
  field :paypal_email_address
  field :paypal_sandbox, :default => false
  
  referenced_in :owner, :class_name => 'User'
  validates :owner, :presence => true
  validates :name, :presence => true
  has_one :web_root, :class_name => 'Page'
  references_many :domain_names
  has_many :articles

  before_create :add_main_menu_items
  after_save :save_web_root
  has_many :galleries
  has_many :main_menu_items, :class_name => 'MenuItem'

  has_mongoid_attached_file :stylesheet_attachment,
    :path => "projects/:project_id/stylesheet.css",
    :storage => :s3,
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  
  def stylesheet
    if self.stylesheet_attachment.file?
      self.stylesheet_attachment.url
    else
      self.layout
    end
  end
  
  def pages
    web_root.children
  end
  
  def self.find_by_domain(domain)
    DomainName.where(:domain_name => domain).first.project
  end
  
  def save_web_root
    build_web_root(:title=>'Web Root') unless web_root
    web_root.save
  end
  
  def add_main_menu_items
    
  end
end

