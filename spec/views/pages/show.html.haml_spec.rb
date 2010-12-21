require 'spec_helper'

describe "pages/show.html.haml" do
  before(:each) do
    @page = assign(:page, john_q(:page, :new_record? => true,
      :path_fragment => "Path Fragment",
      :name => "Name",
      :title => "Title",
      :body => "Body",
      :css => "Css"
    ))


  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Path Fragment".to_s)
    rendered.should contain("Name".to_s)
    rendered.should contain("Title".to_s)
    rendered.should contain("Body".to_s)
    rendered.should contain("Css".to_s)
  end
end
