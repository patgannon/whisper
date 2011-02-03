module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the users? sign in page/
      '/users/sign_in'
    when /the project page for "([^"]*)"/
      project = Project.where(:name=>$1).sort{|x,y| y.date_created <=> x.date_created}.first
      "/projects/#{project.id}"
    when /the users? sign out page/
      '/users/sign_out'
    when /the edit page for "([^"]*)"/
      page = Page.where(:title=>$1).sort{|x,y| 
          y.date_created <=> x.date_created
      }.first
      "/projects/#{page.project.id}/pages/#{page.id}/edit"
    when /any (.*) page/
      "/#{$1.tableize}/#{$1.singularize.camelize.constantize.create!.id}"
    when /the my projects page/
      '/projects'
    when /the edit page for a project titled "([^"]*)"/
      "/projects/#{new_project_id $1}/edit"


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
  def new_project_id(title)
    User.last.projects.create!(:title=>title).id
  end
end

World(NavigationHelpers)
