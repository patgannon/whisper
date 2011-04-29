require 'spec_helper'

describe "articles/new.html.haml" do
  before(:each) do
    assign(:article, stub_model(Article,
      :title => "MyString",
      :body => "MyText",
      :published => false
    ).as_new_record)
    stub_ability
  end

  it "renders new article form" do
    render

    rendered.should have_selector("form", :action => articles_path, :method => "post") do |form|
      form.should have_selector("input#article_title", :name => "article[title]")
      form.should have_selector("textarea#html", :name => "article[body]")
      form.should have_selector("input#article_published", :name => "article[published]")
    end
  end
end
