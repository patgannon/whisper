require 'spec_helper'

describe "articles/show.html.haml" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :title => "Title",
      :body => "MyText",
      :published => false
    ))
    stub_ability
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
  end
end
