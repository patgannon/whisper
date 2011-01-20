require 'spec_helper'

describe "pages/index.html.haml" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :title => "Title",
        :html => "Html"
      ),
      stub_model(Page,
        :title => "Title",
        :html => "Html"
      )
    ])
    controller.stub(:current_user) { User.guest }
    controller.stub(:current_ability) { User.guest }

  end

  it "renders a list of pages" do

    render
    rendered.should have_selector("span.field_value", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("span.field_value", :content => "Html".to_s, :count => 2)
  end
end
