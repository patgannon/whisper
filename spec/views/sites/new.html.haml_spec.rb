require 'spec_helper'

describe "sites/new.html.haml" do
  before(:each) do


    @site = assign(:site, stub_model(Site,
      :domain => "MyString",
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new site form" do
    render

    rendered.should have_selector("form", :action => sites_path, :method => "post") do |form|
      form.should have_selector("input#site_domain", :name => "site[domain]")
      form.should have_selector("input#site_title", :name => "site[title]")
      form.should have_selector("textarea#site_body", :name => "site[body]")
    end
  end
end
