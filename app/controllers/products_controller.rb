class ProductsController < ApplicationController
  respond_to :html, :js

  def index
    @products = @project.products.order_by([[:name, :asc]]).page(params[:page])
    respond_with @products
  end

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end

  def new
    @product = Product.new
    respond_with @product
  end

  def edit
    @product = Product.find(params[:id])
    respond_with @product
  end

  def create
    @product = Product.new(params[:product])
    @product.project = @project
    @product.save
    respond_with(@product)
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    respond_with(@product)
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_with @product, :location => products_path
  end
end
