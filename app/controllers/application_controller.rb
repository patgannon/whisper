class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  before_filter :current_site
  def current_site
    @current_site ||= Site.find :first, {:conditions => {:domain=>request.env['SERVER_NAME']}}
  end
end
