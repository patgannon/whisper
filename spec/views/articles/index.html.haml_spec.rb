require 'spec_helper'

describe "articles/index.html.haml" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :title => "Title",
        :body => "MyText",
        :published => false
      ),
      stub_model(Article,
        :title => "Title",
        :body => "MyText",
        :published => false
      )
    ])
    stub_ability
  end

  it "renders a list of articles" do
    render
    rendered.should have_selector("h2", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("div.article", :content => "MyText".to_s, :count => 2)
  end
end
