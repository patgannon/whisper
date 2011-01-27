class DomainNamesController < InheritedResources::Base
  belongs_to :project
  respond_to :html, :js, :json
  
  def create
    create! do |success, failure|
      success.html { redirect_to parent_url }
    end
  end
end
