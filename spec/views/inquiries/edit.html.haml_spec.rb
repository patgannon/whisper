require 'spec_helper'

describe "inquiries/edit.html.haml" do
  before(:each) do
    @inquiry = assign(:inquiry, stub_model(Inquiry,
      :name => "MyString",
      :email => "MyString",
      :subject => "MyString",
      :message => "MyText"
    ))
  end

  it "renders the edit inquiry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inquiries_path(@inquiry), :method => "post" do
      assert_select "input#inquiry_name", :name => "inquiry[name]"
      assert_select "input#inquiry_email", :name => "inquiry[email]"
      assert_select "input#inquiry_subject", :name => "inquiry[subject]"
      assert_select "textarea#inquiry_message", :name => "inquiry[message]"
    end
  end
end
