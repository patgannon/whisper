
def john_q(type, stubs={})
  any_old type, stubs
end

def any_old(type, stubs={})
  type = type.to_s.camelize.constantize
  ivar = '@mock_' + type.name.downcase
  (mock_obj = instance_variable_get(ivar) || mock_model(type).as_null_object).tap do |node|
    node.stub(stubs) unless stubs.empty?
  end
  instance_variable_set(ivar, mock_obj)
  mock_obj
end

def stub_inherited_resources_helpers(view, resource=nil)
  view.stub(:resource_url) {"/foobar"}
  view.stub(:edit_resource_url) {"/foobar"}
  view.stub(:resource_url) {"/projects/#{resource.try(:id) || '1'}/tags/1}"}
  view.stub(:resource_url).with(resource) {"/projects/#{resource.try(:id) || '1'}/tags/1"}
  view.stub(:new_resource_url) {"/projects/#{resource.try(:id) || '1'}/tags/new"}
  view.stub(:edit_resource_url) {"/projects/#{resource.try(:id) || '1'}/tags/#{resource.try(:id) || '1'}/edit"}
  view.stub(:edit_resource_url).with(resource) {"/projects/1/tags/#{resource.try(:id) || '1'}/edit"}
  view.stub(:collection_url) {"/projects/1/tags"}
  view.stub(:parent_url) {"/projects/1"}
end


