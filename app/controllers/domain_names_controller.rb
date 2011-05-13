class DomainNamesController < ApplicationController
  respond_to :html, :js

  def index
    @domain_names = @project.domain_names.order_by([[:domain_name, :asc]]).page(params[:page])
    respond_with @domain_names
  end

  def show
    @domain_name = DomainName.find(params[:id])
    respond_with @domain_name
  end

  def new
    @domain_name = DomainName.new
    respond_with @domain_name
  end

  def edit
    @domain_name = DomainName.find(params[:id])
    respond_with @domain_name
  end

  def create
    @domain_name = DomainName.new(params[:domain_name])
    @domain_name.project = @project
    @domain_name.save
    respond_with(@domain_name, :location => domain_names_path)
  end

  def update
    @domain_name = DomainName.find(params[:id])
    @domain_name.update_attributes(params[:domain_name])
    respond_with(@domain_name, :location => domain_names_path)
  end
  
  def destroy
    @domain_name = DomainName.find(params[:id])
    @domain_name.destroy
    respond_with @domain_name, :location => domain_names_path
  end
end
