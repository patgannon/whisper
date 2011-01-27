class PagesController < InheritedResources::Base
  belongs_to :project
  respond_to :html, :js, :json
  
  before_filter :parse_url
  
  def parse_url
    domain_name = DomainName.where(:domain_name=>request.env["SERVER_NAME"]).first
    unless domain_name
      raise "Domain name not found '#{request.env["SERVER_NAME"]}'"
    else
      project = domain_name.project
      if params["title1"]
        @page = Page.where(:project_id=>project.id, :title=>params["title1"]).first
        @project = project
      elsif params["root_path"]
        @page = project.pages.first
        @project = project
      end
    end
  end
  
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
