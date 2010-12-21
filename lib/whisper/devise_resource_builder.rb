module Whisper::DeviseResourceBuiler
  extend ActiveSupport::Concern
  
  included do
    alias_method_chain :build_resource, :embedding
  end
  
  def build_resource_with_embedding(hash=nil)
    hash ||= params[resource_name] || {}
    if resource_class == User
      self.resource = @site.users.build(hash)
    else
      build_resource_without_embedding(hash)
    end
  end
end

