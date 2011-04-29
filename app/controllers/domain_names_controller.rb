class DomainNamesController < ApplicationController
  respond_to :html, :js, :json

  def create
    @domain_name = @project.domain_names.build(params[:domain_name])
    if @domain_name.save
      flash[:notice] = "Added domain #{@domain_name.domain_name} to project."
      redirect_to @project
    end
  end
end
