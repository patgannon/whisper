require 'spec_helper'

describe "sites/show.html.haml" do
  before(:each) do
    @site = assign(:site, john_q(:site, :new_record? => true,
      :domain => "Domain",
      :title => "Title",
      :body => "MyText"
    ))


  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Domain".to_s)
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
  end
end
