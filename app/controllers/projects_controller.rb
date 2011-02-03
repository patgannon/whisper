class ProjectsController < InheritedResources::Base
  include InheritedResources::DSL
  before_filter :authenticate_user!
  before_filter :load_user
  
  respond_to :json, :html, :js
  belongs_to :user
  
  def load_user
    @user = current_user
  end
  
  update! do |success, failure|
    success.html {redirect_to projects_path}
  end
  create! do |success, failure|
    success.html {redirect_to projects_path}
  end
  destroy! do |success, failure|
    success.html {redirect_to projects_path}
  end
end
