class PagesController < InheritedResources::Base
  belongs_to :project
  respond_to :html, :js, :json
  
  def create
    @page = parent.pages.build(params[:page])
    @page.html = @page.title unless @page.html
    create! do |success, failure|
      success.html {
        flash[:notice] = "Your page has been created."
        redirect_to edit_resource_url(resource)
      }
    end
  end
  def update
    @page = parent.pages.find(params[:id])
    @page.update_attributes!(:html => params[:html])
    respond_with @page
  end
end
