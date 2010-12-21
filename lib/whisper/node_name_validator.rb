# Verifies that the node's name is unique among children
# of its parent.
class NodeNameValidator < ActiveModel::Validator
  def validate(node)
    if Node.exists?(:conditions=>{:_id.ne =>node._id, :parent_id=>node.parent.try(:id), :path_fragment=>node.name.identify})
      node.errors[node.class.canonical_name] << "Is already taken."
    end
  end
end

