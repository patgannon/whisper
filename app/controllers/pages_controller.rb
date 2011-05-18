class PagesController < ApplicationController
  respond_to :html, :js, :json
  
  before_filter :load_page, :only => :show
  before_filter :load_parent_project
  
  def index
    @pages = @project.pages
  end
  
  def load_page
    if params["title1"]
      @page = @project.pages.where(:title => CGI.unescape(params["title1"])).first
      if params["title2"]
        @page = @page.children.where(:title=>CGI.unescape(params["title2"])).first
      end
    elsif params["root_path"]
      @page = @project.pages.first
    end
  end
  
  def show
    @page = Page.find(params[:id]) if params[:id] && @page.nil?
    raise "Page not found: #{env["REQUEST_URI"]}" unless @page
  end
  
  def create
    @page = @project.pages.build(params[:page])
    @page.html = "<h1>This is your new page</h1>#{@page.title}" unless @page.html
    if @page.save
      flash[:notice] = "Your page has been created."
      redirect_to "/#{CGI.escape(@page.title)}"
    end
  end
  
  def sort
    Page.sort(params[:menu_page])
    render :nothing => true
  end
  
  def new
    @page = Page.new
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to "/"
  end
  
  def update
    @page = Page.find(params[:id])
    params[:page_elements].try(:each) do |index, attr|
      klass = attr["type"].camelize.constantize
      obj = klass.find attr["id"]
      obj.update_attributes attr["data"]
    end

    respond_with @page
  end
  
  def load_parent_project
    @project = Project.find(params[:project_id]) if params[:project_id]
  end
  
end
