class GalleriesController < InheritedResources::Base
  before_filter :load_project, :load_galleries
  
  def load_galleries
    @galleries = @project.galleries
  end
  
  def index
    @galleries = @project.galleries
  end
  
  def show
    @gallery = Gallery.find(params[:id])
    raise "gallery not found: #{env["REQUEST_URI"]}" unless @gallery
  end
  
  def create
    @gallery = @project.galleries.build(params[:gallery])
    if @gallery.save
      flash[:notice] = "Your gallery has been created."
      redirect_to @gallery
    end
  end

  def new
    @gallery = Gallery.new
  end
  
  def edit
    @gallery = Gallery.find(params[:id])
    @image = Image.new
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_path
  end
  
  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update_attributes!(:html => params[:html])
    respond_with @gallery
  end
end
