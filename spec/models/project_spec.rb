require 'spec_helper'

describe Project do
  it { should have_field(:name).of_type(String) }
  it { should have_field(:description).of_type(String) }
  it { should be_referenced_in(:owner) }
  subject {Project.new(:title=>"Foobar")}
  it {should_not accept_values_for(:name, nil)}
  it {should_not accept_values_for(:owner, nil)}
  it {should accept_values_for(:owner, user('othertg@gmail.com'))}
  it {should reference_many(:pages)}
  it {should reference_many(:domain_names)}
end

