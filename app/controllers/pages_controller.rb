class PagesController < InheritedResources::Base
  def current_ability
    current_user || User.guest
  end
end
