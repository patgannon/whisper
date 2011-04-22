class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user, :load_projects
  
  respond_to :json, :html, :js
  
  def load_user
    @user = current_user
  end
  
  def load_projects
    @projects = @user.projects
  end
  
  def create
    @project = @user.projects.build(params[:project])
    if @project.save
      redirect_to projects_path
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def new
    @project = @user.projects.build
  end

  def update
    @project = Project.find params[:id]
    if @project.update_attributes(params[:project])
      redirect_to @project
    end
  end

  def destroy
    @project = Project.find params[:id]
    if @project.destroy
      redirect_to projects_path
    end
  end
end
