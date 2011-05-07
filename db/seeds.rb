# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.destroy_all
Project.destroy_all
DomainName.destroy_all
Page.destroy_all

User.create!(:email=>'tgannon@gmail.com', :password=>'password', :password_confirmation=>'password').
projects.create!(:name=>'Whisper').tap{|project|
  project.domain_names.create!(:domain_name=>'whisper.com')
  project.domain_names.create!(:domain_name=>'www.example.com')
  project.domain_names.create!(:domain_name=>'localhost')
  project.domain_names.create!(:domain_name=>'www.whisper.com')
  
  project.pages.create!(:title=>'Home', :html => 'Welcome to Whisper')
}

User.create!(:email=>'john.w.gannon@citi.com', :password=>'password', :password_confirmation=>'password').
projects.create!(:name=>'Norcal Freediving', :default_project=>true, :layout=>'norcalfreediving').tap{|project|
  project.domain_names.create!(:domain_name=>'norcalfreediving.com')
  project.domain_names.create!(:domain_name=>'norcalfreediving1.com')
  project.domain_names.create!(:domain_name=>'www.norcalfreediving.com')
  project.pages.create!(:title=>'Home', :html => 'Norcal Freediving Whassup!!!')
}


