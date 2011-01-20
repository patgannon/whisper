require 'spec_helper'

describe "pages/show.html.haml" do
  before(:each) do
    @page = assign(:page, john_q(:page, :new_record? => true,
      :title => "Title",
      :html => "Html"
    ))


    controller.stub(:current_user) { User.guest }
    controller.stub(:current_ability) { User.guest }
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("Html".to_s)
  end
end
