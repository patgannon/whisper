class ImagesController < ApplicationController
  before_filter :load_gallery
  respond_to :json, :html
  
  def load_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end
  
  def show
    @image = Image.find(params[:id])
  end
  
  def create
    @image = @gallery.images.build(params.symbolize_keys[:image])
    if @image.save
      respond_to do |format|
        format.html {redirect_to edit_gallery_path(@gallery)}
        format.json {render :json => {:success => :data}}
      end
    else
      raise @image.errors.inspect
      respond_to do |format|
        format.json {render :json => {:failure => :data}}
      end
    end
  end
end
