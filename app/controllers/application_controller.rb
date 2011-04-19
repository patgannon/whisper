class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_project
  layout :choose_layout
  
  def current_ability
    current_user || User.guest
  end
  
  def load_project
    domain_name = DomainName.where(:domain_name=>request.env["SERVER_NAME"]).first
    unless domain_name
      raise "Domain name not found '#{request.env["SERVER_NAME"]}'"
    else
      @project = domain_name.project
    end
  end

  def choose_layout
    @project.layout
  end
end
