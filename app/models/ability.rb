class Ability
  include Mongoid::Document
  embedded_in :user, :inverse_of =>:abilities
  field :base_behavior, :type => Boolean
  field :actions, :type => Array
  field :subjects, :type => Array
  field :conditions, :type => Hash
  field :position, :type => Integer
  
  def self.from(can_def, user=nil)
    a = new :base_behavior => can_def.base_behavior,
        :actions => can_def.actions.map(&:to_s),
        :subjects => can_def.instance_variable_get("@subjects").map(&:to_s),
        :conditions => can_def.instance_variable_get("@conditions").stringify_keys
    a.user = user if user
    a
  end
  
  def to_can_definition
    CanCan::CanDefinition.new base_behavior, 
                              actions.map(&:to_sym), 
                              subjects.map(&:constantize),
                              conditions, nil
  end
end
