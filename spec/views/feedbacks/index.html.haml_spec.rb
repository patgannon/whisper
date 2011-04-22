require 'spec_helper'

describe "feedbacks/index.html.haml" do
  before(:each) do
    assign(:feedbacks, [
      stub_model(Feedback,
        :email => "Email",
        :subject => "Subject",
        :message => "MyText"
      ),
      stub_model(Feedback,
        :email => "Email",
        :subject => "Subject",
        :message => "MyText"
      )
    ])
  end

  it "renders a list of feedbacks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
