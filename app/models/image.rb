class Image
  include Mongoid::Document
  include Mongoid::Paperclip  

  belongs_to :gallery

  validates :gallery, :presence => true
  validates :image_file_name, :presence => true

  has_mongoid_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :path => "images/:style/:id.:extension",
                    :storage => :s3,
#                    :url => ':s3_authenticated_url', # generates an expiring url
                    :s3_credentials => File.join(Rails.root, 'config', 's3.yml') #,
#                    :s3_permissions => 'private',
#                    :s3_protocol => 'https'  

end

