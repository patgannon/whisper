class SitesController < InheritedResources::Base
  before_filter :load_site

  def load_site
    @site ||= Site.where(:domain=>request.env['SERVER_NAME']).first
  end
end
