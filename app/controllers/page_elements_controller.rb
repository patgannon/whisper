class PageElementsController < ApplicationController
  respond_to :html, :js
  before_filter :load_page

  def index
    @page_elements = @page.elements
    respond_with @page_elements
  end

  def show
    @page_element = PageElement.find(params[:id])
    respond_with @page_element
  end

  def new
    @page_element = PageElement.new
    respond_with @page_element
  end

  def edit
    @page_element = PageElement.find(params[:id])
    respond_with @page_element
  end

  def create
    @page_element = PageElement.new(params[:page_element])
    @page_element.page = @page
    @page_element.save
    respond_with @page_element, :location => page_elements_path(@page)
  end

  def update
    @page_element = PageElement.find(params[:id])
    @page_element.update_attributes(params[:page_element])
    respond_with @page_element, :location => page_elements_path(@page)
  end
  
  def destroy
    @page_element = PageElement.find(params[:id])
    @page_element.destroy
    respond_with @page_element, :location => page_elements_path(@page)
  end

  def load_page
    @page = Page.find params[:page_id]
  end
end

