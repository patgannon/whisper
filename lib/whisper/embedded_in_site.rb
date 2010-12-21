module EmbeddedInSite
  def embedded_in_site(options={})
    
    class_eval do
      embedded_in :site, :inverse_of => name.tableize.to_sym
    end
    class_name = self.name
    Site.class_eval do
      embeds_many class_name.tableize.to_sym
    
    end
  end
end
