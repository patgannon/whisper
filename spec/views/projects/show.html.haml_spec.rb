require 'spec_helper'

describe "projects/show.html.haml" do
  before(:each) do
    @project = assign(:project, john_q(:project, :new_record? => true,
      :name => "Name",
      :description => "Description"
    ))


    controller.stub(:current_user) { User.guest }
    controller.stub(:current_ability) { User.guest }
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Description".to_s)
  end
end
