class MenuItem
  include Mongoid::Document
  
  field :target_class, :type => String
  field :target_id, :type => BSON::ObjectId
  field :title, :type => String
  
#  def target=(new_target)
#    unless new_target.kind_of?(Mongoid::Document) && !new_target.new_record?
#      raise "Menu item targets can only accept already persisted mongoid documents."
#    end
#    @target = new_target
#    self.target_id = new_target.id
#    self.target_class = new_target.class.name
#    
#    self.title ||= new_target.title if new_target.class.method_defined?(:title)
#  end
#  
#  def target
#    @target ||= target_class.constantize.find(target_id) unless target_class.nil?
#  end
end

