class PagesController < ApplicationController
  respond_to :html, :js, :json
  layout :choose_layout
  
  before_filter :load_project
  before_filter :load_page, :only => :show
  
  def index
    @pages = @project.pages
  end
  
  def load_project
    domain_name = DomainName.where(:domain_name=>request.env["SERVER_NAME"]).first
    unless domain_name
      raise "Domain name not found '#{request.env["SERVER_NAME"]}'"
    else
      @project = domain_name.project
    end
  end
  
  def load_page
    if params["title1"]
      @page = @project.pages.where(:title => params["title1"]).first
      if params["title2"]
        @page = @page.children.where(:title=>params["title2"]).first
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
      redirect_to "/#{@page.title}"
    end
  end
  
  def sort
    ids = params[:menu_page]
    puts params[:menu_page].inspect
    ids.each_with_index{|x, i|
      page = Page.find(x)
      puts "saving page #{page.id} with position #{i}"
      page.update_attributes!(:position => i)
    }
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
    @page = @project.pages.find(params[:id])
    @page.update_attributes!(:html => params[:html])
    respond_with @page
  end
  
  def choose_layout
    @project.layout
  end
end
