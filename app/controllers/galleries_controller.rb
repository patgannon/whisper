class GalleriesController < ApplicationController
  before_filter :load_project
  respond_to :html
  
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
    end
    respond_with @gallery
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
    
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Updated the gallery."
    end
    respond_with @gallery
  end
end

