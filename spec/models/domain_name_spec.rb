require 'spec_helper'

describe DomainName do
  it { should have_field(:domain_name).of_type(String) }
  it { should be_referenced_in(:project) }
  it {should_not accept_values_for(:project, nil)}
  it "should save domain_name in lower case" do
    DomainName.create!(
      :project => some_new_project, :domain_name=>"Cool.com"
    ).domain_name.should be == "cool.com"
  end
end

